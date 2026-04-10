// Add: `dart-define`でファイルを読み込みのため
import java.util.Base64
import java.util.Properties

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Add: dart-defines
val dartDefines = if (project.hasProperty("dart-defines")) {
    project.property("dart-defines")
        .toString()
        .split(",")
        .associate { entry ->
            val pair = String(Base64.getDecoder().decode(entry), Charsets.UTF_8).split("=")
            // valueがemptyの時にlastがkeyになるので、lengthが2でなければ空のmapにする
            if (pair.size == 2) pair[0] to pair[1] else "" to ""
        }
        .filterKeys { it.isNotEmpty() }
} else {
    emptyMap<String, String>()
}

// Add: アイコンや`google-services.json`の環境毎の読み替え
val copySources by tasks.registering(Copy::class) {
    copy {
        from("src/${dartDefines["flavor"]}/res")
        into("src/main/res")
    }
    copy {
        from("src/${dartDefines["flavor"]}/google-services.json")
        into("./.")
    }
}

tasks.named("preBuild") {
    dependsOn(copySources)
}

// Add: リリース署名設定のロード
val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) {
        keystorePropertiesFile.inputStream().use { load(it) }
    }
}

android {
    namespace = "com.yakuran.nanto_nack"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = dartDefines["androidPackageName"] ?: "com.yakuran.nanto_nack.dev"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        resValue("string", "app_name", dartDefines["appName"] ?: "(dev)NantoNack")
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                val requiredKeys = listOf("keyAlias", "keyPassword", "storeFile", "storePassword")
                val missingKeys = requiredKeys.filter { keystoreProperties[it] == null || keystoreProperties[it].toString().isBlank() }
                if (missingKeys.isNotEmpty()) {
                    throw IllegalStateException(
                        "key.properties が存在しますが、必須キーが不足しています: $missingKeys\n" +
                        "key.properties に keyAlias, keyPassword, storeFile, storePassword をすべて設定してください。"
                    )
                }
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        release {
            // リリースビルドタスクが指定されている場合のみ key.properties を必須とする
            // (assembleDebug 等では key.properties がなくてもビルドできるようにする)
            val isReleaseBuild = gradle.startParameter.taskNames.any {
                it.contains("Release", ignoreCase = true) || it.contains("Bundle", ignoreCase = true)
            }
            if (isReleaseBuild && !keystorePropertiesFile.exists()) {
                throw GradleException(
                    "リリースビルドに必要な key.properties が見つかりません。\n" +
                    "期待されるパス: ${keystorePropertiesFile.absolutePath}\n" +
                    "リリース署名の設定を含む key.properties を配置してください。"
                )
            }
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }
}

flutter {
    source = "../.."
}

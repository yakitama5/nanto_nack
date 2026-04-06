// Add: `dart-define`でファイルを読み込みのため
import java.util.Base64

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

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

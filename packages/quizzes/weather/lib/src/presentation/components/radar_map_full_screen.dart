import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../i18n/weather_translations_extension.dart';

class RadarMapFullScreen extends StatelessWidget {
  const RadarMapFullScreen({super.key, this.onBack});

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<WeatherAppTheme>()!;
    return Scaffold(
      backgroundColor: ext.radarFullScreenBackground,
      appBar: AppBar(
        backgroundColor: ext.radarFullScreenAppBarColor,
        automaticallyImplyLeading: onBack == null,
        iconTheme: IconThemeData(color: ext.radarFullScreenTextColor),
        leading: onBack != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onBack,
              )
            : null,
        title: UnreadableText(
          context.sq.common.radarMapDetail,
          isObfuscated: true,
          animateOnObfuscate: false,
          style: TextStyle(color: ext.radarFullScreenTextColor),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ext.radarBackground,
        child: CustomPaint(
          painter: _RadarMapPainter(
            landColor: ext.radarLandColor,
            seaColor: ext.radarSeaColor,
            cloudGreen: ext.radarCloudGreen,
            cloudYellow: ext.radarCloudYellow,
            cloudRed: ext.radarCloudRed,
            gridColor: ext.radarGridColor,
          ),
        ),
      ),
    );
  }
}

class _RadarMapPainter extends CustomPainter {
  const _RadarMapPainter({
    required this.landColor,
    required this.seaColor,
    required this.cloudGreen,
    required this.cloudYellow,
    required this.cloudRed,
    required this.gridColor,
  });

  final Color landColor;
  final Color seaColor;
  final Color cloudGreen;
  final Color cloudYellow;
  final Color cloudRed;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // 背景（陸地）
    paint.color = landColor;
    canvas.drawRect(Offset.zero & size, paint);

    // 海
    paint.color = seaColor;
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4),
      paint,
    );

    // 雨雲（緑）
    paint.color = cloudGreen.withValues(alpha: 0.7);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.3, size.height * 0.4),
        width: size.width * 0.3,
        height: size.height * 0.2,
      ),
      paint,
    );

    // 雨雲（黄）
    paint.color = cloudYellow.withValues(alpha: 0.8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.45, size.height * 0.35),
        width: size.width * 0.2,
        height: size.height * 0.15,
      ),
      paint,
    );

    // 雨雲（赤）
    paint.color = cloudRed.withValues(alpha: 0.8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.3),
        width: size.width * 0.12,
        height: size.height * 0.1,
      ),
      paint,
    );

    // グリッド線
    paint
      ..color = gridColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    for (var i = 0; i <= 4; i++) {
      final x = size.width * i / 4;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_RadarMapPainter oldDelegate) =>
      landColor != oldDelegate.landColor ||
      seaColor != oldDelegate.seaColor ||
      cloudGreen != oldDelegate.cloudGreen ||
      cloudYellow != oldDelegate.cloudYellow ||
      cloudRed != oldDelegate.cloudRed ||
      gridColor != oldDelegate.gridColor;
}

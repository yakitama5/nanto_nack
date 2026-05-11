import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../i18n/weather_translations_extension.dart';
import 'radar_map_full_screen.dart';

class RadarMapCard extends StatelessWidget {
  const RadarMapCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<WeatherAppTheme>()!;
    return GestureDetector(
      onTap: () {
        onTap();
        unawaited(
          Navigator.of(context).push(
            PageRouteBuilder<void>(
              pageBuilder: (_, _a, _b) => const RadarMapFullScreen(),
              transitionDuration: const Duration(milliseconds: 400),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 160,
        decoration: BoxDecoration(
          color: ext.radarBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ext.cardBorderColor),
        ),
        child: Hero(
          tag: 'radar_map',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: CustomPaint(
                    painter: _RadarMapThumbnailPainter(
                      landColor: ext.radarLandColor,
                      seaColor: ext.radarSeaColor,
                      cloudGreen: ext.radarCloudGreen,
                      cloudYellow: ext.radarCloudYellow,
                      cloudRed: ext.radarCloudRed,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ext.radarLabelBackground,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.radar,
                          color: ext.radarLabelTextColor,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        UnreadableText(
                          context.sq.common.radarMap,
                          isObfuscated: true,
                          animateOnObfuscate: false,
                          style: TextStyle(
                            color: ext.radarLabelTextColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadarMapThumbnailPainter extends CustomPainter {
  const _RadarMapThumbnailPainter({
    required this.landColor,
    required this.seaColor,
    required this.cloudGreen,
    required this.cloudYellow,
    required this.cloudRed,
  });

  final Color landColor;
  final Color seaColor;
  final Color cloudGreen;
  final Color cloudYellow;
  final Color cloudRed;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = landColor;
    canvas.drawRect(Offset.zero & size, paint);
    paint.color = seaColor;
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4),
      paint,
    );
    paint.color = cloudGreen.withValues(alpha: 0.7);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.3, size.height * 0.4),
        width: size.width * 0.3,
        height: size.height * 0.2,
      ),
      paint,
    );
    paint.color = cloudYellow.withValues(alpha: 0.8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.45, size.height * 0.35),
        width: size.width * 0.2,
        height: size.height * 0.15,
      ),
      paint,
    );
    paint.color = cloudRed.withValues(alpha: 0.8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.3),
        width: size.width * 0.12,
        height: size.height * 0.1,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(_RadarMapThumbnailPainter oldDelegate) =>
      landColor != oldDelegate.landColor ||
      seaColor != oldDelegate.seaColor ||
      cloudGreen != oldDelegate.cloudGreen ||
      cloudYellow != oldDelegate.cloudYellow ||
      cloudRed != oldDelegate.cloudRed;
}

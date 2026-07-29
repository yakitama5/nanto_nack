import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:slides/slides/hook_slide.dart';
import 'package:slides/slides/why_slide.dart';

void main() {
  runApp(
    TranslationProvider(
      child: const ProviderScope(child: SlidesApp()),
    ),
  );
}

class SlidesApp extends StatelessWidget {
  const SlidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        background: FlutterDeckBackgroundConfiguration(
          light: FlutterDeckBackground.solid(Color(0xFFF7F5FC)),
        ),
        footer: FlutterDeckFooterConfiguration(showSlideNumbers: true),
        progressIndicator: FlutterDeckProgressIndicator.gradient(
          gradient: LinearGradient(
            colors: [Color(0xFF6C4DE0), Color(0xFFE0483C)],
          ),
        ),
      ),
      slides: const [
        HookSlide(),
        WhySlide(),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

class SupaTextSettings {
  final TextThemeScales textThemeScales;
  final M3DefaultSizes m3DefaultSizes;

  SupaTextSettings({
    required this.textThemeScales,
    required this.m3DefaultSizes,
  });
}

class M3DefaultSizes {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  M3DefaultSizes({
    this.displayLarge = const TextStyle(fontSize: 57),
    this.displayMedium = const TextStyle(fontSize: 45),
    this.displaySmall = const TextStyle(fontSize: 36),
    this.headlineLarge = const TextStyle(fontSize: 32),
    this.headlineMedium = const TextStyle(fontSize: 28),
    this.headlineSmall = const TextStyle(fontSize: 24),
    this.titleLarge = const TextStyle(fontSize: 22),
    this.titleMedium = const TextStyle(fontSize: 16),
    this.titleSmall = const TextStyle(fontSize: 14),
    this.labelLarge = const TextStyle(fontSize: 14),
    this.labelMedium = const TextStyle(fontSize: 12),
    this.labelSmall = const TextStyle(fontSize: 6),
    this.bodyLarge = const TextStyle(fontSize: 16),
    this.bodyMedium = const TextStyle(fontSize: 14),
    this.bodySmall = const TextStyle(fontSize: 12),
  });
}

class TextThemeScales {
  final double xsScale;
  final double xsBigScale;
  final double mScale;
  final double lScale;
  final double xlScale;

  TextThemeScales(
      {this.xsScale = 0.95,
      this.xsBigScale = 0.75,
      this.mScale = 1.05,
      this.lScale = 1.15,
      this.xlScale = 1.2});
}

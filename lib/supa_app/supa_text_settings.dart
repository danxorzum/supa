import 'package:flutter/cupertino.dart';

class SupaTextSettings {
  ///Default Settings for your respinsive design.
  SupaTextSettings({
    required this.textThemeScales,
    required this.m3DefaultSizes,
  });

  ///Scales for your app.
  final TextThemeScales textThemeScales;

  ///Default fontSized for your app.
  final M3DefaultSizes m3DefaultSizes;
}

class M3DefaultSizes {
  ///Material 3 default font sizes.
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

  ///Default [fontSize] 57.0
  final TextStyle displayLarge;

  ///Default [fontSize] 45.0
  final TextStyle displayMedium;

  ///Default [fontSize] 36.0
  final TextStyle displaySmall;

  ///Default [fontSize] 32.0
  final TextStyle headlineLarge;

  ///Default [fontSize] 28.0
  final TextStyle headlineMedium;

  ///Default [fontSize] 24.0
  final TextStyle headlineSmall;

  ///Default [fontSize] 22.0
  final TextStyle titleLarge;

  ///Default [fontSize] 16.0
  final TextStyle titleMedium;

  ///Default [fontSize] 14.0
  final TextStyle titleSmall;

  ///Default [fontSize] 14.0
  final TextStyle labelLarge;

  ///Default [fontSize] 12.0
  final TextStyle labelMedium;

  ///Default [fontSize] 6.0
  final TextStyle labelSmall;

  ///Default [fontSize] 16.0
  final TextStyle bodyLarge;

  ///Default [fontSize] 14.0
  final TextStyle bodyMedium;

  ///Default [fontSize] 12.0
  final TextStyle bodySmall;
}

class TextThemeScales {
  ///Default Settings for your respinsive scale.
  TextThemeScales(
      {this.xsScale = 0.95,
      this.xsBigScale = 0.75,
      this.mScale = 1.05,
      this.lScale = 1.15,
      this.xlScale = 1.2});

  ///Scale for extra small devices.
  ///By default is 0.95
  final double xsScale;

  ///Second scale for extra small devices.
  ///By default is 0.75
  final double xsBigScale;

  ///Scale for medium devices.
  ///By default is 1.05
  final double mScale;

  ///Scale for large devices.
  ///By default is 1.15
  final double lScale;

  ///Scale for extra large devices.
  ///By default is 1.2
  final double xlScale;
}

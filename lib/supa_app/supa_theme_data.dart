import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupaThemeData {
  late final SupaColor primary;
  late final SupaColor secondary;
  late final SupaColor tertiary;
  late final SupaColor background;
  late final SupaColor scaffoldBackground;
  late final SupaColor container;
  late final SupaColor error;

  late final CupertinoThemeData _cTheme;

  final bool useCupertino;

  SupaThemeData(
      {SupaColor? primary,
      SupaColor? secondary,
      SupaColor? tertiary,
      SupaColor? background,
      SupaColor? scaffoldBackground,
      SupaColor? container,
      SupaColor? error,
      ColorScheme? colorScheme,
      this.useCupertino = true}) {
    this.primary =
        primary ?? SupaColor(color: Colors.pinkAccent, onColor: Colors.white);
    this.secondary = secondary ??
        SupaColor(color: const Color(0xFFff7fac), onColor: Colors.white);
    this.tertiary = tertiary ??
        SupaColor(color: const Color(0xFFfff4f5), onColor: Colors.white);
    this.background = background ??
        SupaColor(color: const Color(0xFFfff8f8), onColor: Colors.white);
    this.scaffoldBackground = scaffoldBackground ??
        SupaColor(color: const Color(0xFFffe1e7), onColor: Colors.white);
    this.container = container ??
        SupaColor(color: const Color(0xFFffcdda), onColor: Colors.white);
    this.error = error ??
        SupaColor(color: const Color(0xFFba1a1a), onColor: Colors.white);
    _cTheme = CupertinoThemeData(
      barBackgroundColor: this.background.color,
      primaryColor: this.primary.color,
      primaryContrastingColor: this.primary.onColor,
      scaffoldBackgroundColor: this.scaffoldBackground.color,
    );
  }
}

class SupaColor {
  final Color color;
  final Color onColor;

  SupaColor({required this.color, required this.onColor});
}

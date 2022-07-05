import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supa/supa_app/supa_text_theme.dart';

class SupaThemeData {
  final SupaColor primary;
  final SupaColor secondary;
  final SupaColor tertiary;
  final SupaColor background;
  final SupaColor scaffoldBackground;
  final SupaColor container;
  final SupaColor error;
  final bool isLight;
  final SupaTextTheme textTheme;

  const SupaThemeData({
    this.primary =
        const SupaColor(color: Colors.pinkAccent, onColor: Colors.white),
    this.secondary =
        const SupaColor(color: Color(0xFFff7fac), onColor: Colors.white),
    this.tertiary =
        const SupaColor(color: Color(0xFFfff4f5), onColor: Colors.white),
    this.background =
        const SupaColor(color: Color(0xFFfff8f8), onColor: Colors.white),
    this.scaffoldBackground =
        const SupaColor(color: Color(0xFFffe1e7), onColor: Colors.white),
    this.container =
        const SupaColor(color: Color(0xFFffcdda), onColor: Colors.white),
    this.error =
        const SupaColor(color: Color(0xFFba1a1a), onColor: Colors.white),
    this.isLight = true,
    required this.textTheme,
  });

  static SupaThemeData light(
          {SupaColor? primary,
          SupaColor? secondary,
          SupaColor? tertiary,
          SupaColor? background,
          SupaColor? scaffoldBackground,
          SupaColor? container,
          SupaColor? error,
          bool? isLight,
          SupaTextTheme? textTheme}) =>
      SupaThemeData(
        primary: primary ??
            const SupaColor(color: Colors.pinkAccent, onColor: Colors.white),
        secondary: secondary ??
            const SupaColor(color: Color(0xFFff7fac), onColor: Colors.white),
        tertiary: tertiary ??
            const SupaColor(color: Color(0xFFfff4f5), onColor: Colors.white),
        background: background ??
            const SupaColor(color: Color(0xFFfff8f8), onColor: Colors.white),
        scaffoldBackground: scaffoldBackground ??
            const SupaColor(color: Color(0xFFffe1e7), onColor: Colors.white),
        container: container ??
            const SupaColor(color: Color(0xFFffcdda), onColor: Colors.white),
        error: error ??
            const SupaColor(color: Color(0xFFba1a1a), onColor: Colors.white),
        isLight: isLight ?? true,
        textTheme: textTheme ??
            const SupaTextTheme(
              display: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              headline: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              title: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              label: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              body: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
      );

  SupaThemeData copyWith({
    SupaColor? primary,
    SupaColor? secondary,
    SupaColor? tertiary,
    SupaColor? background,
    SupaColor? scaffoldBackground,
    SupaColor? container,
    SupaColor? error,
    bool? isLight,
    SupaTextTheme? textTheme,
  }) {
    return SupaThemeData(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      background: background ?? this.background,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      container: container ?? this.container,
      error: error ?? this.error,
      isLight: isLight ?? this.isLight,
      textTheme: textTheme ?? this.textTheme,
    );
  }

  CupertinoThemeData toCupertino() => CupertinoThemeData(
        barBackgroundColor: background.color,
        primaryColor: primary.color,
        primaryContrastingColor: primary.onColor,
        scaffoldBackgroundColor: scaffoldBackground.color,
        brightness: isLight ? Brightness.light : Brightness.dark,
      );
  ThemeData toMaterial() => ThemeData.from(
          colorScheme: ColorScheme.light(
        primary: primary.color,
        onPrimary: primary.onColor,
        secondary: secondary.color,
        onSecondary: secondary.onColor,
        tertiary: tertiary.color,
        onTertiary: tertiary.onColor,
        surface: background.color,
        onSurface: background.onColor,
        background: background.color,
        onBackground: background.onColor,
        error: error.color,
        onError: error.onColor,
        brightness: isLight ? Brightness.light : Brightness.dark,
      ));
}

class SupaColor {
  final Color color;
  final Color onColor;

  const SupaColor({required this.color, required this.onColor});

  SupaColor inverse() => SupaColor(
        color: onColor,
        onColor: color,
      );
}

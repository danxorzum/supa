part of 'theme.dart';

class SupaThemeData {
  final SupaColor primary;
  final SupaColor secondary;
  final SupaColor tertiary;
  final SupaColor background;
  final SupaColor scaffoldBackground;
  final SupaColor container;
  final SupaColor error;
  final bool isLight;
  final bool enableScale;
  final SupaTextTheme textTheme;
  late SupaTextTheme _base;

  SupaThemeData({
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
    this.enableScale = true,
    required this.textTheme,
  }) {
    _base = textTheme;
  }

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
          textTheme: textTheme ?? supaTextTheme);

  SupaThemeData copyWith({
    SupaColor? primary,
    SupaColor? secondary,
    SupaColor? tertiary,
    SupaColor? background,
    SupaColor? scaffoldBackground,
    SupaColor? container,
    SupaColor? error,
    bool? isLight,
    bool? enableScale,
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
      enableScale: enableScale ?? this.enableScale,
    );
  }

  CupertinoThemeData toCupertino() => CupertinoThemeData(
      barBackgroundColor: background.color,
      primaryColor: primary.color,
      primaryContrastingColor: primary.onColor,
      scaffoldBackgroundColor: scaffoldBackground.color,
      brightness: isLight ? Brightness.light : Brightness.dark,
      textTheme: textTheme.toCupertino(primary.color));
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

  static SupaThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<SupaTheme>()?.data;
    assert(theme != null);
    return theme!;
  }

  SupaThemeData resize(ScreenSize screenSize) {
    final copy = copyWith(
      textTheme: textTheme.screenScale(screenSize, _base),
    );
    copy._base = _base;
    return copy;
  }
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

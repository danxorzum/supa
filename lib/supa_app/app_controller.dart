import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';
import 'supa_text_settings.dart';

class AppController with ChangeNotifier {
  AppController({
    // this.useMaterial3 = false,
    ThemeMode? themeMode,
    ThemeData? theme,
    ThemeData? darkTheme,
    SupaTextSettings? settings,
  }) {
    _ligth = theme ?? ThemeData.light();
    _dark = darkTheme;
    _themeMode = themeMode ?? ThemeMode.system;
    _ss = ssFromWidth(
        WidgetsFlutterBinding.ensureInitialized().window.physicalSize.width /
            WidgetsFlutterBinding.ensureInitialized().window.devicePixelRatio);
    _textScale =
        WidgetsFlutterBinding.ensureInitialized().window.textScaleFactor;
    _settings = settings ??
        SupaTextSettings(
            textThemeScales: TextThemeScales(),
            m3DefaultSizes: M3DefaultSizes());
    _lightTextThemeBase =
        _ligth.textTheme.merge(_prepareTextTheme(_ligth.textTheme));
    _lightTextTheme = _lightTextThemeBase;
  }

  late final SupaTextSettings _settings;
  // late final TextTheme _baseTextTheme;
  // late final TextTheme? _baseDarkTextTheme;

  late ThemeMode _themeMode;
  late ThemeData _ligth;
  late ThemeData? _dark;
  late TextTheme _lightTextTheme;
  TextTheme? _darkTextTheme;
  late final TextTheme _lightTextThemeBase;
  // late final TextTheme? _darkTextThemeBase;
  late ScreenSize _ss;
  late double _textScale;
  final ValueNotifier<AppLifecycleState> _state =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.resumed);
  final ValueNotifier<AppLifecycleState> _lastsState =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.inactive);
  // final bool useMaterial3;

  //getters
  ScreenSize get ss => _ss;
  ThemeData get themeData => _ligth.copyWith(textTheme: _lightTextTheme);
  ThemeData? get darkThemeData => _dark;
  ThemeMode get themeMode => _themeMode;
  AppLifecycleState get state => _state.value;
  AppLifecycleState get lastState => _lastsState.value;
  ValueNotifier<AppLifecycleState> get stateNotifier => _state;
  ValueNotifier<AppLifecycleState> get lastStateNotifier => _lastsState;

  onTextScaleChanged() {
    _textScale = WidgetsBinding.instance!.window.textScaleFactor;
    _recalculateTextTheme();
    notifyListeners();
  }

  ///Do not call it out runApp.
  void verifySizes() {
    final width = WidgetsBinding.instance?.window.physicalSize.width;
    final pRatio = WidgetsBinding.instance?.window.devicePixelRatio;
    assert(width != null && pRatio != null,
        'Wrong use of verifySizes. Use only insede runApp');
    final newSs = ssFromWidth(width! / pRatio!);

    if (_ss != newSs) {
      _ss = newSs;
      _recalculateTextTheme();
      notifyListeners();
    }
  }

  ///Do not call it never if you are using [SupaApp].
  ///[SupaApp] will listend [AppLifecycleState] changes.
  ///if you aren't using [SupaApp] you can call it manually.
  ///you can decide if notifyListeners() or not whit [canNotifyListeners].
  void updateLifecycleState(AppLifecycleState state, bool canNotifyListeners) {
    _lastsState.value = _state.value;
    _state.value = state;
    if (canNotifyListeners) notifyListeners();
  }

  void _recalculateTextTheme() {
    {
      switch (_ss) {
        case ScreenSize.xs:
          _lightTextTheme = _lightTextThemeBase;

          _lightTextTheme = _lightTextThemeBase.copyWith(
              displaySmall: _lightTextThemeBase.displaySmall?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.xsScale),
              headlineLarge: _lightTextThemeBase.headlineLarge?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.xsScale),
              headlineMedium: _lightTextThemeBase.headlineMedium?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.xsScale),
              headlineSmall: _lightTextThemeBase.headlineSmall?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.xsScale),
              bodyLarge: _lightTextThemeBase.bodyLarge?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.xsScale),
              bodyMedium: _lightTextThemeBase.bodyMedium?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.xsScale),
              bodySmall: _lightTextThemeBase.bodySmall?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.xsScale));
          break;
        case ScreenSize.s:
          _lightTextTheme = _lightTextThemeBase;

          break;
        case ScreenSize.m:
          _lightTextTheme = _lightTextThemeBase;
          _lightTextTheme = _lightTextThemeBase.copyWith(
            displaySmall: _lightTextThemeBase.displaySmall?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.mScale),
            headlineLarge: _lightTextThemeBase.headlineLarge?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.mScale),
            headlineMedium: _lightTextThemeBase.headlineMedium?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.mScale),
          );

          break;
        case ScreenSize.l:
          _lightTextTheme = _lightTextThemeBase;
          _lightTextTheme = _lightTextThemeBase.copyWith(
              displaySmall: _lightTextThemeBase.displaySmall?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.lScale),
              headlineLarge: _lightTextThemeBase.headlineLarge?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.lScale),
              headlineMedium: _lightTextThemeBase.headlineMedium?.apply(
                  fontSizeFactor:
                      _textScale * _settings.textThemeScales.lScale));

          break;
        case ScreenSize.xl:
          _lightTextTheme = _lightTextThemeBase;
          _lightTextTheme = _lightTextThemeBase.copyWith(
            displaySmall: _lightTextThemeBase.displaySmall?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
            headlineLarge: _lightTextThemeBase.headlineLarge?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
            headlineMedium: _lightTextThemeBase.headlineMedium?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
            headlineSmall: _lightTextThemeBase.headlineSmall?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
            bodyLarge: _lightTextThemeBase.bodyLarge?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
            bodyMedium: _lightTextThemeBase.bodyMedium?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
            bodySmall: _lightTextThemeBase.bodySmall?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
          );

          break;
      }
    }
  }

//If theme doesn't has fontsSize, it will be set to default
  TextTheme _prepareTextTheme(TextTheme theme) {
    if (theme.bodyLarge?.fontSize == null &&
        theme.bodyMedium?.fontSize == null &&
        theme.bodySmall?.fontSize == null &&
        theme.headlineLarge?.fontSize == null &&
        theme.headlineMedium?.fontSize == null &&
        theme.headlineSmall?.fontSize == null &&
        theme.displayLarge?.fontSize == null &&
        theme.displayMedium?.fontSize == null &&
        theme.displaySmall?.fontSize == null &&
        theme.titleLarge?.fontSize == null &&
        theme.titleMedium?.fontSize == null &&
        theme.titleSmall?.fontSize == null &&
        theme.labelLarge?.fontSize == null &&
        theme.labelMedium?.fontSize == null &&
        theme.labelSmall?.fontSize == null) {
      return theme.copyWith(
        displayLarge: _settings.m3DefaultSizes.displayLarge,
        displayMedium: _settings.m3DefaultSizes.displayMedium,
        displaySmall: _settings.m3DefaultSizes.displaySmall,
        headlineLarge: _settings.m3DefaultSizes.headlineLarge,
        headlineMedium: _settings.m3DefaultSizes.headlineMedium,
        headlineSmall: _settings.m3DefaultSizes.headlineSmall,
        bodyLarge: _settings.m3DefaultSizes.bodyLarge,
        bodyMedium: _settings.m3DefaultSizes.bodyMedium,
        bodySmall: _settings.m3DefaultSizes.bodySmall,
        titleLarge: _settings.m3DefaultSizes.titleLarge,
        titleMedium: _settings.m3DefaultSizes.titleMedium,
        titleSmall: _settings.m3DefaultSizes.titleSmall,
        labelLarge: _settings.m3DefaultSizes.labelLarge,
        labelMedium: _settings.m3DefaultSizes.labelMedium,
        labelSmall: _settings.m3DefaultSizes.labelSmall,
      );
    }
    return theme;
  }
}

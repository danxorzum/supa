import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';
import 'supa_text_settings.dart';

class AppController with ChangeNotifier {
  ///Created a controller for the app.
  ///
  ///The controller automatically manage rezing of the  font app.
  ///
  ///The controller defaults only work with material 3.
  ///
  ///If you don't sent [theme] or [darkTheme] automatically the controller will create it.
  ///if you don't want a [darkTheme] just doesn't use it.
  AppController({
    ///The theme of the app, use it to change the theme of the app.
    ///Default is [ThemeMode.system].
    ThemeMode? themeMode,

    ///The default [ThemeData] of the app.
    ///By default it created a material 3 theme.
    ///If [theme]s [TextTheme] is null, the controller will create it.
    ///and also if [TextTheme]doesn't have any font size, the controller will create it based on [settings].
    ThemeData? theme,
    ThemeData? darkTheme,

    ///Manage the text sizes and how scale the text.
    SupaTextSettings? settings,
  }) {
    _settings = settings ??
        SupaTextSettings(
            textThemeScales: TextThemeScales(),
            m3DefaultSizes: M3DefaultSizes());
    _theme = theme ?? _defaultTheme();
    _dark = darkTheme ?? _defaultTheme(isDark: true);
    _themeMode = themeMode ?? ThemeMode.system;
    _ss = ScreenSize.whatsSize(
        WidgetsFlutterBinding.ensureInitialized().window.physicalSize.width /
            WidgetsFlutterBinding.ensureInitialized().window.devicePixelRatio);
    _textScale =
        WidgetsFlutterBinding.ensureInitialized().window.textScaleFactor;
    _setTheme(theme, false);
    _setTheme(darkTheme, true);
  }

  late final SupaTextSettings _settings;
  late ThemeMode _themeMode;
  late ThemeData _theme;
  late ThemeData _dark;
  late final TextTheme _textThemeBase;
  late final TextTheme _darkTextThemeBase;
  late ScreenSize _ss;
  late double _textScale;
  final ValueNotifier<AppLifecycleState> _state =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.resumed);
  final ValueNotifier<AppLifecycleState> _lastsState =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.inactive);

  //getters

  ///The current [ScreenSize] of the app.
  ScreenSize get ss => _ss;

  ///The current [TextTheme] of the app.
  ///Set the [TextTheme] of the app with the [AppController.themeData]
  ThemeData get themeData => _theme;

  ///Dark theme of the app.
  ///if you don't need a dark theme just don't use it.
  ThemeData get darkThemeData => _dark;

  ///By defaul the [ThemeMode] of the app is [ThemeMode.system].
  ThemeMode get themeMode => _themeMode;

  ///Get the current [AppLifecycleState] of the app.
  AppLifecycleState get state => _state.value;

  ///Get the last [AppLifecycleState] of the app.
  AppLifecycleState get lastState => _lastsState.value;

  ///Get the current [AppLifecycleState] in a value notifier.
  ///you can use it to listen to the state of the app.
  ValueNotifier<AppLifecycleState> get stateNotifier => _state;

  ///Get the last [AppLifecycleState] in a value notifier.
  ///you can use it to listen to the state of the app.
  ValueNotifier<AppLifecycleState> get lastStateNotifier => _lastsState;

  ///Ff you are using [SupaApp] you don't need to call this method.
  ///[SupaApp] will listen for you.
  ///
  ///Call it when the [textScaleFactor] of the app change.
  void onTextScaleChanged() {
    _textScale = WidgetsBinding.instance.window.textScaleFactor;
    _theme = _recalculateTextTheme(_textThemeBase);
    _dark = _recalculateTextTheme(_darkTextThemeBase);
    notifyListeners();
  }

  ///if you are using [SupaApp] you don't need to call this method.
  ///[SupaApp] will listen for you.
  ///
  ///Do not call it out runApp.
  ///Call it when device dimensions changes.
  void verifySizes() {
    final width = WidgetsBinding.instance.window.physicalSize.width;
    final pRatio = WidgetsBinding.instance.window.devicePixelRatio;
    final newSs = ScreenSize.whatsSize(width / pRatio);

    if (_ss != newSs) {
      _ss = newSs;
      _theme = _recalculateTextTheme(_textThemeBase);
      _dark = _recalculateTextTheme(_darkTextThemeBase);
      notifyListeners();
    }
  }

  ///If you are using [SupaApp] you don't need to call this method.
  ///[SupaApp] will listend [AppLifecycleState] changes.
  ///By default [SupaApp] set[canNotifyListeners] to true.
  ///
  ///Call it when the [AppLifecycleState] of the app change.
  ///you can decide if notifyListeners() or not whit [canNotifyListeners].
  void updateLifecycleState(AppLifecycleState state, bool canNotifyListeners) {
    _lastsState.value = _state.value;
    _state.value = state;
    if (canNotifyListeners) notifyListeners();
  }

  ///Rezise the font of the app.
  ThemeData _recalculateTextTheme(TextTheme base) {
    late final TextTheme textTheme;
    switch (_ss) {
      case ScreenSize.w:
        textTheme = base.copyWith(
            displaySmall: base.displaySmall?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsBigScale),
            headlineLarge: base.headlineLarge?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsBigScale),
            headlineMedium: base.headlineMedium?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsBigScale),
            headlineSmall: base.headlineSmall?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsBigScale),
            bodyLarge: base.bodyLarge?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsBigScale),
            bodyMedium: base.bodyMedium?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsBigScale),
            bodySmall: base.bodySmall?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsBigScale));
        break;
      case ScreenSize.xs:
        textTheme = base.copyWith(
            displaySmall: base.displaySmall?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xsScale),
            headlineLarge: base.headlineLarge?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xsScale),
            headlineMedium: base.headlineMedium?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xsScale),
            headlineSmall: base.headlineSmall?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xsScale),
            bodyLarge: base.bodyLarge?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xsScale),
            bodyMedium: base.bodyMedium?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.xsScale),
            bodySmall: base.bodySmall?.apply(
                fontSizeFactor:
                    _textScale * _settings.textThemeScales.xsScale));
        break;
      case ScreenSize.s:
        textTheme = base;
        break;
      case ScreenSize.m:
        textTheme = base.copyWith(
          displaySmall: base.displaySmall?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.mScale),
          headlineLarge: base.headlineLarge?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.mScale),
          headlineMedium: base.headlineMedium?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.mScale),
        );

        break;
      case ScreenSize.l:
        textTheme = base.copyWith(
            displaySmall: base.displaySmall?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.lScale),
            headlineLarge: base.headlineLarge?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.lScale),
            headlineMedium: base.headlineMedium?.apply(
                fontSizeFactor: _textScale * _settings.textThemeScales.lScale));

        break;
      case ScreenSize.xl:
        textTheme = base.copyWith(
          displaySmall: base.displaySmall?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
          headlineLarge: base.headlineLarge?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
          headlineMedium: base.headlineMedium?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
          headlineSmall: base.headlineSmall?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
          bodyLarge: base.bodyLarge?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
          bodyMedium: base.bodyMedium?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
          bodySmall: base.bodySmall?.apply(
              fontSizeFactor: _textScale * _settings.textThemeScales.xlScale),
        );

        break;
    }
    return _theme.copyWith(textTheme: textTheme);
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

//Generatedefaults themes
  ThemeData _defaultTheme({bool isDark = false}) => ThemeData.from(
      colorScheme:
          isDark ? const ColorScheme.dark() : const ColorScheme.light(),
      useMaterial3: true,
      textTheme: _prepareTextTheme(isDark
          ? Typography.material2021().white
          : Typography.material2021().black));

  void _setTheme(ThemeData? theme, bool isDark) {
    if (isDark) {
      if (theme == null) {
        _darkTextThemeBase =
            _dark.textTheme.merge(_prepareTextTheme(_theme.textTheme));
        _dark = _dark.copyWith(
          textTheme: _darkTextThemeBase,
        );
      } else {
        _darkTextThemeBase = theme.textTheme;
      }
      _dark = _recalculateTextTheme(_darkTextThemeBase);
    } else {
      if (theme == null) {
        _textThemeBase =
            _theme.textTheme.merge(_prepareTextTheme(_theme.textTheme));
        _theme = _theme.copyWith(textTheme: _textThemeBase);
      } else {
        _textThemeBase = theme.textTheme;
      }
      _theme = _recalculateTextTheme(_textThemeBase);
    }
  }

  ///If you are using [SupaApp] it rebuilds theme on theme change.
  ///
  ///Change your app [Theme] and notify [SupaApp] or any [Listeners].
  void changeThemeMode(ThemeMode newMode) {
    _themeMode = newMode;
    notifyListeners();
  }
}

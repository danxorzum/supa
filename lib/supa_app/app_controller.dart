import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';
import 'supa_text_settings.dart';
import 'extensions.dart';

class AppController with ChangeNotifier {
  AppController({
    ThemeMode? themeMode,
    ThemeData? theme,
    ThemeData? darkTheme,
    SupaTextSettings? settings,
  }) {
    _ligth = theme ?? ThemeData();
    _dark = darkTheme;
    _themeMode = themeMode ?? ThemeMode.system;
    _ss = ssFromWidth(
        WidgetsFlutterBinding.ensureInitialized().window.physicalSize.width /
            WidgetsFlutterBinding.ensureInitialized().window.devicePixelRatio);
    _textScale =
        WidgetsFlutterBinding.ensureInitialized().window.textScaleFactor;
    _settings =
        settings ?? SupaTextSettings(textThemeScales: TextThemeScales());
    _baseTextTheme = _ligth.textTheme;
    _baseDarkTextTheme = _dark?.textTheme;
    _currentTextTheme = _baseTextTheme;
    _currentDarkTextTheme = _baseDarkTextTheme;
  }

  late final SupaTextSettings _settings;
  late final TextTheme _baseTextTheme;
  late final TextTheme? _baseDarkTextTheme;
  late TextTheme _currentTextTheme;
  late TextTheme? _currentDarkTextTheme;

  late ThemeMode _themeMode;
  late ThemeData _ligth;
  late ThemeData? _dark;
  late ScreenSize _ss;
  late double _textScale;
  final ValueNotifier<AppLifecycleState> _state =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.resumed);
  final ValueNotifier<AppLifecycleState> _lastsState =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.inactive);

  //getters
  ScreenSize get ss => _ss;
  ThemeData get themeData => _ligth;
  ThemeData? get darkThemeData => _dark;
  ThemeMode get themeMode => _themeMode;
  AppLifecycleState get state => _state.value;
  AppLifecycleState get lastState => _lastsState.value;
  ValueNotifier<AppLifecycleState> get stateNotifier => _state;
  ValueNotifier<AppLifecycleState> get lastStateNotifier => _lastsState;

  onTextScaleChanged() {
    _textScale = WidgetsBinding.instance!.window.textScaleFactor;
    _recalculateTheme();
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
      _recalculateTheme();
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

  void _recalculateTheme() {
    _recalculateTextTheme();
    _ligth = _ligth.copyWith(textTheme: _currentTextTheme);
    _dark = _dark?.copyWith(textTheme: _currentDarkTextTheme);
  }

  void _recalculateTextTheme() {
    if (_baseTextTheme.bodyText2 != null) {
      switch (_ss) {
        case ScreenSize.xs:
          _currentTextTheme = _baseTextTheme.scale(
              _settings.textThemeScales.xsScale,
              deviceTextScaleFactor: _textScale);
          _currentDarkTextTheme = _baseDarkTextTheme?.scale(
              _settings.textThemeScales.xsScale,
              deviceTextScaleFactor: _textScale);
          break;
        case ScreenSize.s:
          _currentTextTheme =
              _baseTextTheme.scale(1, deviceTextScaleFactor: _textScale);
          _currentDarkTextTheme =
              _baseDarkTextTheme?.scale(1, deviceTextScaleFactor: _textScale);
          break;
        case ScreenSize.m:
          _currentTextTheme = _baseTextTheme.scale(
              _settings.textThemeScales.mScale,
              deviceTextScaleFactor: _textScale);
          _currentDarkTextTheme = _baseDarkTextTheme?.scale(
              _settings.textThemeScales.mScale,
              deviceTextScaleFactor: _textScale);
          break;
        case ScreenSize.l:
          _currentTextTheme = _baseTextTheme.scale(
              _settings.textThemeScales.lScale,
              deviceTextScaleFactor: _textScale);
          _currentDarkTextTheme = _baseDarkTextTheme?.scale(
              _settings.textThemeScales.lScale,
              deviceTextScaleFactor: _textScale);
          break;
        case ScreenSize.xl:
          _currentTextTheme = _baseTextTheme.scale(
              _settings.textThemeScales.xlScale,
              deviceTextScaleFactor: _textScale);
          _currentDarkTextTheme = _baseDarkTextTheme?.scale(
              _settings.textThemeScales.xlScale,
              deviceTextScaleFactor: _textScale);
          break;
      }
    } else {
      _currentTextTheme =
          _baseTextTheme.scale(1, deviceTextScaleFactor: _textScale);
      _currentDarkTextTheme =
          _baseDarkTextTheme?.scale(1, deviceTextScaleFactor: _textScale);
      switch (_ss) {
        case ScreenSize.xs:
          _currentTextTheme = _baseTextTheme.copyWith(
            displaySmall: _baseTextTheme.displaySmall
                ?.scale(_settings.textThemeScales.xsScale),
            headlineLarge: _baseTextTheme.headlineLarge
                ?.scale(_settings.textThemeScales.xsBigScale),
            headlineMedium: _baseTextTheme.headlineMedium
                ?.scale(_settings.textThemeScales.xsBigScale),
            headlineSmall: _baseTextTheme.headlineSmall
                ?.scale(_settings.textThemeScales.xsBigScale),
            bodyLarge: _baseTextTheme.bodyLarge
                ?.scale(_settings.textThemeScales.xsScale),
            bodyMedium: _baseTextTheme.bodyMedium
                ?.scale(_settings.textThemeScales.xsScale),
            bodySmall: _baseTextTheme.bodySmall
                ?.scale(_settings.textThemeScales.xsScale),
          );

          _currentDarkTextTheme = _baseDarkTextTheme?.copyWith(
            displaySmall: _baseDarkTextTheme?.displaySmall
                ?.scale(_settings.textThemeScales.xsScale),
            headlineLarge: _baseDarkTextTheme?.headlineLarge
                ?.scale(_settings.textThemeScales.xsBigScale),
            headlineMedium: _baseDarkTextTheme?.headlineMedium
                ?.scale(_settings.textThemeScales.xsBigScale),
            headlineSmall: _baseDarkTextTheme?.headlineSmall
                ?.scale(_settings.textThemeScales.xsBigScale),
            bodyLarge: _baseDarkTextTheme?.bodyLarge
                ?.scale(_settings.textThemeScales.xsScale),
            bodyMedium: _baseDarkTextTheme?.bodyMedium
                ?.scale(_settings.textThemeScales.xsScale),
            bodySmall: _baseDarkTextTheme?.bodySmall
                ?.scale(_settings.textThemeScales.xsScale),
          );
          break;
        case ScreenSize.s:
          _currentTextTheme = _baseTextTheme;
          _currentDarkTextTheme = _baseDarkTextTheme;
          break;
        case ScreenSize.m:
          _currentTextTheme = _baseTextTheme.copyWith(
              displaySmall: _baseTextTheme.displaySmall
                  ?.scale(_settings.textThemeScales.mScale),
              headlineLarge: _baseTextTheme.headlineLarge
                  ?.scale(_settings.textThemeScales.mScale),
              headlineMedium: _baseTextTheme.headlineMedium
                  ?.scale(_settings.textThemeScales.mScale));

          _currentDarkTextTheme = _baseDarkTextTheme?.copyWith(
              displaySmall: _baseDarkTextTheme?.displaySmall
                  ?.scale(_settings.textThemeScales.mScale),
              headlineLarge: _baseDarkTextTheme?.headlineLarge
                  ?.scale(_settings.textThemeScales.mScale),
              headlineMedium: _baseDarkTextTheme?.headlineMedium
                  ?.scale(_settings.textThemeScales.mScale));
          break;
        case ScreenSize.l:
          _currentTextTheme = _baseTextTheme.copyWith(
              displaySmall: _baseTextTheme.displaySmall
                  ?.scale(_settings.textThemeScales.lScale),
              headlineLarge: _baseTextTheme.headlineLarge
                  ?.scale(_settings.textThemeScales.lScale),
              headlineMedium: _baseTextTheme.headlineMedium
                  ?.scale(_settings.textThemeScales.lScale));

          _currentDarkTextTheme = _baseDarkTextTheme?.copyWith(
              displaySmall: _baseDarkTextTheme?.displaySmall
                  ?.scale(_settings.textThemeScales.lScale),
              headlineLarge: _baseDarkTextTheme?.headlineLarge
                  ?.scale(_settings.textThemeScales.lScale),
              headlineMedium: _baseDarkTextTheme?.headlineMedium
                  ?.scale(_settings.textThemeScales.lScale));
          break;
        case ScreenSize.xl:
          _currentTextTheme = _baseTextTheme.copyWith(
              displaySmall: _baseTextTheme.displaySmall
                  ?.scale(_settings.textThemeScales.xlScale),
              headlineLarge: _baseTextTheme.headlineLarge
                  ?.scale(_settings.textThemeScales.xlScale),
              headlineMedium: _baseTextTheme.headlineMedium
                  ?.scale(_settings.textThemeScales.xlScale),
              headlineSmall: _baseTextTheme.headlineSmall
                  ?.scale(_settings.textThemeScales.xlScale),
              bodyLarge: _baseTextTheme.bodyLarge
                  ?.scale(_settings.textThemeScales.xlScale),
              bodyMedium: _baseTextTheme.bodyMedium
                  ?.scale(_settings.textThemeScales.xlScale),
              bodySmall: _baseTextTheme.bodySmall
                  ?.scale(_settings.textThemeScales.xlScale));

          _currentDarkTextTheme = _baseDarkTextTheme?.copyWith(
              displaySmall: _baseDarkTextTheme?.displaySmall
                  ?.scale(_settings.textThemeScales.xlScale),
              headlineLarge: _baseDarkTextTheme?.headlineLarge
                  ?.scale(_settings.textThemeScales.xlScale),
              headlineMedium: _baseDarkTextTheme?.headlineMedium
                  ?.scale(_settings.textThemeScales.xlScale),
              headlineSmall: _baseDarkTextTheme?.headlineSmall
                  ?.scale(_settings.textThemeScales.xlScale),
              bodyLarge: _baseDarkTextTheme?.bodyLarge
                  ?.scale(_settings.textThemeScales.xlScale),
              bodyMedium: _baseDarkTextTheme?.bodyMedium
                  ?.scale(_settings.textThemeScales.xlScale),
              bodySmall: _baseDarkTextTheme?.bodySmall
                  ?.scale(_settings.textThemeScales.xlScale));
          break;
      }
    }
  }
}

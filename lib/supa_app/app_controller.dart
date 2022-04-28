import 'package:flutter/material.dart';

import 'package:supa/supa.dart';

class AppController with ChangeNotifier {
  AppController({
    ThemeMode? themeMode,
    ThemeData? theme,
    ThemeData? darkTheme,
  }) {
    _ligth = theme ?? ThemeData();
    _dark = darkTheme;
    _themeMode = themeMode ?? ThemeMode.system;
    _ss = ssFromWidth(
        WidgetsFlutterBinding.ensureInitialized().window.physicalSize.width /
            WidgetsFlutterBinding.ensureInitialized().window.devicePixelRatio);
    _textScale =
        WidgetsFlutterBinding.ensureInitialized().window.textScaleFactor;
  }

  late ThemeMode _themeMode;
  late ThemeData _ligth;
  late ThemeData? _dark;
  late ScreenSize _ss;
  late double _textScale;
  AppLifecycleState _state = AppLifecycleState.resumed;
  AppLifecycleState _lastsState = AppLifecycleState.inactive;

  //getters
  ScreenSize get ss => _ss;
  ThemeData get themeData => _ligth;
  ThemeData? get darkThemeData => _dark;
  ThemeMode get themeMode => _themeMode;
  AppLifecycleState get state => _state;
  AppLifecycleState get lastState => _lastsState;

  onTextScaleChanged(SupaSettings settings) {
    _textScale = WidgetsBinding.instance!.window.textScaleFactor;
    _recalculateFont(settings.reSize(_ss, _textScale));
    notifyListeners();
  }

  ///Do not call it out runApp.
  void verifySizes(SupaSettings settings) {
    final width = WidgetsBinding.instance?.window.physicalSize.width;
    final pRatio = WidgetsBinding.instance?.window.devicePixelRatio;
    assert(width != null && pRatio != null,
        'Wrong use of verifySizes. Use only insede runApp');
    final newSs = ssFromWidth(width! / pRatio!);

    if (_ss != newSs) {
      _ss = newSs;
      _recalculateFont(settings.reSize(_ss, _textScale));
      notifyListeners();
    }
  }

  setFont(SupaSettings settings) {
    _recalculateFont(settings.reSize(_ss, _textScale));
  }

  ///Do not call it never if you are using [SupaApp].
  ///[SupaApp] will listend [AppLifecycleState] changes.
  ///if you aren't using [SupaApp] you can call it manually.
  ///you can decide if notifyListeners() or not whit [canNotifyListeners].
  void updateLifecycleState(AppLifecycleState state, bool canNotifyListeners) {
    _lastsState = _state;
    _state = state;
    if (canNotifyListeners) notifyListeners();
  }

  void _recalculateFont(SupaTextSize size) {
    _ligth = _ligth.copyWith(
        textTheme: _ligth.textTheme.copyWith(
      overline: _ligth.textTheme.overline?.copyWith(fontSize: size.overline),
      caption: _ligth.textTheme.caption?.copyWith(fontSize: size.caption),
      button: _ligth.textTheme.button?.copyWith(fontSize: size.button),
      bodyText2: _ligth.textTheme.bodyText2?.copyWith(fontSize: size.bodyText2),
      bodyText1: _ligth.textTheme.bodyText1?.copyWith(fontSize: size.bodyText1),
      subtitle2: _ligth.textTheme.subtitle2?.copyWith(fontSize: size.subtitle2),
      subtitle1: _ligth.textTheme.subtitle1?.copyWith(fontSize: size.subtitle1),
      headline6: _ligth.textTheme.headline6?.copyWith(fontSize: size.headline6),
      headline5: _ligth.textTheme.headline5?.copyWith(fontSize: size.headline5),
      headline4: _ligth.textTheme.headline4?.copyWith(fontSize: size.headline4),
      headline3: _ligth.textTheme.headline3?.copyWith(fontSize: size.headline3),
      headline2: _ligth.textTheme.headline2?.copyWith(fontSize: size.headline2),
      headline1: _ligth.textTheme.headline1?.copyWith(fontSize: size.headline1),
    ));
    if (_dark != null) {
      _dark = _dark!.copyWith(
          textTheme: _dark!.textTheme.copyWith(
        overline: _dark!.textTheme.overline?.copyWith(fontSize: size.overline),
        caption: _dark!.textTheme.caption?.copyWith(fontSize: size.caption),
        button: _dark!.textTheme.button?.copyWith(fontSize: size.button),
        bodyText2:
            _dark!.textTheme.bodyText2?.copyWith(fontSize: size.bodyText2),
        bodyText1:
            _dark!.textTheme.bodyText1?.copyWith(fontSize: size.bodyText1),
        subtitle2:
            _dark!.textTheme.subtitle2?.copyWith(fontSize: size.subtitle2),
        subtitle1:
            _dark!.textTheme.subtitle1?.copyWith(fontSize: size.subtitle1),
        headline6:
            _dark!.textTheme.headline6?.copyWith(fontSize: size.headline6),
        headline5:
            _dark!.textTheme.headline5?.copyWith(fontSize: size.headline5),
        headline4:
            _dark!.textTheme.headline4?.copyWith(fontSize: size.headline4),
        headline3:
            _dark!.textTheme.headline3?.copyWith(fontSize: size.headline3),
        headline2:
            _dark!.textTheme.headline2?.copyWith(fontSize: size.headline2),
        headline1:
            _dark!.textTheme.headline1?.copyWith(fontSize: size.headline1),
      ));
    }
  }
}

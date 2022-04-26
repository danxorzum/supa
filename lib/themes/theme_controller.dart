import 'package:flutter/material.dart';

import 'package:supa/tools/screen_tools/screen_tools.dart';

class SupaThemeController with ChangeNotifier {
  SupaThemeController({
    ThemeMode? themeMode,
    // ThemeData? lightTheme, ThemeData? darkTheme
  }) {
    _themeMode = themeMode ?? ThemeMode.system;
    // _ligth = lightTheme ?? ThemeData();
    // _dark = darkTheme ?? ThemeData.dark();
    _ss = ssFromWidth(
        WidgetsFlutterBinding.ensureInitialized().window.physicalSize.width /
            WidgetsFlutterBinding.ensureInitialized().window.devicePixelRatio);
  }

  late ThemeMode _themeMode;
  late ThemeData _ligth;
  late ThemeData _dark;
  late ScreenSize _ss;

  //getters
  ScreenSize get ss => _ss;
  ThemeData get themeData => _ligth;
  ThemeData get darkThemeData => _dark;
  ThemeMode get themeMode => _themeMode;

  void initializer({ThemeData? lightTheme, ThemeData? darkTheme}) {
    _ligth = lightTheme ?? ThemeData();
    _dark = darkTheme ?? ThemeData.dark();
  }

  ///Do not call it out runApp.
  void verifySizes() {
    final newSs = ssFromWidth(
        WidgetsBinding.instance!.window.physicalSize.width /
            WidgetsBinding.instance!.window.devicePixelRatio);
    if (_ss != newSs) {
      _ss = newSs;
      //TODO: recalculate fonts
      notifyListeners();
    }
  }
}

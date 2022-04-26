import 'package:flutter/material.dart';
import 'package:supa/themes/theme_controller.dart';
import 'package:supa/tools/screen_tools/screen_tools.dart';

class SupaAppTheme extends InheritedWidget {
  SupaAppTheme(
      {required this.controller,
      ThemeData? lightTheme,
      ThemeData? darkTheme,
      Key? key,
      required Widget child})
      : super(key: key, child: child) {
    _ss = controller.ss;
    controller.initializer(lightTheme: lightTheme, darkTheme: darkTheme);
  }

  final SupaThemeController controller;
  late final ScreenSize _ss;

  static SupaAppTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SupaAppTheme>();
  }

  @override
  bool updateShouldNotify(SupaAppTheme oldWidget) {
    return _ss != oldWidget._ss;
  }
}

import 'package:flutter/material.dart';
import 'package:supa/themes/theme_app.dart';

import 'package:supa/themes/theme_controller.dart';
import 'package:supa/tools/screen_tools/screen_tools.dart';

class SupaTheme extends StatefulWidget {
  const SupaTheme(
      {required this.child,
      required this.controller,
      Key? key,
      this.theme,
      this.darkTheme})
      : super(key: key);

  final Widget child;
  final SupaThemeController controller;
  final ThemeData? theme;
  final ThemeData? darkTheme;

  @override
  State<SupaTheme> createState() => _SupaThemeState();
}

class _SupaThemeState extends State<SupaTheme> with WidgetsBindingObserver {
  Size _size = WidgetsBinding.instance!.window.physicalSize;
  final _ratio = WidgetsBinding.instance!.window.devicePixelRatio;
  double _scaleText = WidgetsBinding.instance!.window.textScaleFactor;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _size = WidgetsBinding.instance!.window.physicalSize;
    _update();
  }

  @override
  void didChangeTextScaleFactor() {
    _scaleText = WidgetsBinding.instance!.window.textScaleFactor;
    super.didChangeTextScaleFactor();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // TODO: implement didChangeAppLifecycleState
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SupaAppTheme(
      controller: widget.controller,
      lightTheme: widget.theme,
      darkTheme: widget.darkTheme,
      child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, __) {
            return widget.child;
          }),
    );
  }

  _update() {
    if (widget.controller.ss != ssFromWidth(_size.width * _ratio)) {
      widget.controller.verifySizes();
    }
  }
}

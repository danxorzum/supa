import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';
import 'app_controller.dart';

class SupaChild extends InheritedWidget {
  SupaChild({required this.controller, Key? key, required Widget child})
      : super(key: key, child: child) {
    _ss = controller.ss;
  }

  final AppController controller;
  late final ScreenSize _ss;

  static SupaChild of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<SupaChild>();
    assert(widget != null, 'SupaChild is not found, did you forget to add it?');
    return widget!;
  }

  @override
  bool updateShouldNotify(SupaChild oldWidget) {
    return _ss != oldWidget._ss;
  }
}

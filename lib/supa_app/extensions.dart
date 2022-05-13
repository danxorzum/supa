import 'package:flutter/material.dart';

import 'supa_child.dart';
import 'app_controller.dart';

extension SupaAppExtension on BuildContext {
  /// Get your [AppController].
  AppController get appController => SupaChild.of(this).controller;
}

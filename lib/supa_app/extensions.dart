import 'package:flutter/material.dart';

import 'supa_child.dart';
import 'app_controller.dart';

extension SupaAppExtension on BuildContext {
  AppController get appController => SupaChild.of(this).controller;
}

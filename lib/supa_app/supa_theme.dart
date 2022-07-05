import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supa/supa_app/supa_theme_data.dart';

class SupaTheme extends InheritedWidget {
  SupaTheme(
      {required SupaThemeData supaThemeData, super.key, required super.child}) {
    _supaThemeData = supaThemeData;
  }

  late final SupaThemeData _supaThemeData;

  static SupaThemeData of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<SupaTheme>()
            ?._supaThemeData ??
        SupaThemeData.light();
  }

  @override
  bool updateShouldNotify(SupaTheme oldWidget) {
    return false;
  }
}

import 'package:flutter/widgets.dart';

class SupaTextTheme {
  ///The [TextTheme] of the app.
  const SupaTextTheme(
      {required this.display,
      required this.headline,
      required this.title,
      required this.label,
      required this.body});

  final TextStyle display;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle label;
  final TextStyle body;
}

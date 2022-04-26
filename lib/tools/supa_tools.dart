import 'package:flutter/widgets.dart';

export 'package:supa/tools/extensions/export.dart';
export 'package:supa/tools/helpers/helpers_tools.dart';

class SupaTools {
  static Widget layoutHandler(
      BoxConstraints constraints, Widget screen, Widget page,
      {int maxWidth = 1000}) {
    return constraints.maxWidth > maxWidth ? page : screen;
  }
}

import 'package:flutter/widgets.dart';

export 'extensions/export.dart';
export 'screen_tools/screen_tools.dart';

/// This class has many useful methods to work, specially with layouts and responsive things.
class SupaTools {
  /// Returns layout[Widget].
  /// if the current[BoxConstraints] is tablet or desktop it returns the tablet or desktop layout[Widget].
  /// Recives a phone layout[Widget] and a tablet  or desktop layout[Widget] and the current[BoxConstraints].
  /// By default evaluate [maxWidth] on 1000 but you can change it sending [maxWidth].
  static Widget layoutHandler(
      BoxConstraints constraints, Widget screen, Widget page,
      {int maxWidth = 1000}) {
    return constraints.maxWidth > maxWidth ? page : screen;
  }
}

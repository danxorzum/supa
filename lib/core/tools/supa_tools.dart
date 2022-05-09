import 'package:flutter/material.dart';

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

  static TextTheme customFastTextTheme({
    required TextStyle displayMedium,
    required TextStyle headlineMedium,
    required TextStyle titleMedium,
    required TextStyle labelMedium,
    required TextStyle bodyMedium,
  }) {
    assert(
        displayMedium.fontSize! > 12 &&
            headlineMedium.fontSize! > 4 &&
            titleMedium.fontSize! > 4 &&
            labelMedium.fontSize! > 4 &&
            bodyMedium.fontSize! > 4,
        'Invalid font size. The fontSize cant be 0, your current value when are calculated drop values equals or less than 0');
    return TextTheme(
      displayLarge: displayMedium.copyWith(
        fontSize: displayMedium.fontSize! + 12,
        // height: displayMedium.height! + 12
      ),
      displayMedium: displayMedium,
      displaySmall: displayMedium.copyWith(
        fontSize: displayMedium.fontSize! - 9,
        // height: displayMedium.height! - 8
      ),
      headlineLarge: headlineMedium.copyWith(
        fontSize: headlineMedium.fontSize! + 4,
        // height: headlineMedium.height! + 4
      ),
      headlineMedium: headlineMedium,
      headlineSmall: headlineMedium.copyWith(
        fontSize: headlineMedium.fontSize! - 2,
        // height: headlineMedium.height! - 2
      ),
      titleLarge: titleMedium.copyWith(
        fontSize: titleMedium.fontSize! + 6,
        // height: titleMedium.height! + 4,
      ),
      titleMedium: titleMedium,
      titleSmall: titleMedium.copyWith(
        fontSize: titleMedium.fontSize! - 2,
        // height: titleMedium.height! - 4,
      ),
      labelLarge: labelMedium.copyWith(
        fontSize: labelMedium.fontSize! + 2,
        // height: labelMedium.height! + 4,
      ),
      labelMedium: labelMedium,
      labelSmall: labelMedium.copyWith(
        fontSize: labelMedium.fontSize! - 6,
        // height: labelMedium.height! - 5,
      ),
      bodyLarge: bodyMedium.copyWith(
        fontSize: bodyMedium.fontSize! + 2,
        // height: bodyMedium.height! + 4,
      ),
      bodyMedium: bodyMedium,
      bodySmall: bodyMedium.copyWith(
        fontSize: bodyMedium.fontSize! - 2,
        // height: bodyMedium.height! - 4,
      ),
    );
  }
}

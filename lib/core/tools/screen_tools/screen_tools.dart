import 'package:flutter/material.dart';

import '../extensions/export.dart';

/// Diferent sizes for the app
enum ScreenSize {
  /// Extra small
  xs(offset: Offset(0, 360)),

  /// Small
  s(offset: Offset(361, 768)),

  /// Medium
  m(offset: Offset(769, 1024)),

  /// Large
  l(offset: Offset(1025, 1200)),

  /// Extra large
  xl(offset: Offset(1201, double.infinity));

  const ScreenSize({required this.offset});

  /// Offset for the screen size
  final Offset offset;

  static ScreenSize whatsSize(double width) {
    assert(
        width > 0, 'Width must be positive, also has to be real screen size');

    for (var element in ScreenSize.values) {
      if (element.offset.isInRange(width)) return element;
    }

    throw Exception('No screen size found for width: $width');
  }
}

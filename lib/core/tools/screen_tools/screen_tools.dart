import 'package:flutter/material.dart';

import '../extensions/export.dart';

/// Diferent sizes for the app
enum ScreenSize {
  /// Extra small
  xs,

  /// Small
  s,

  /// Medium
  m,

  /// Large
  l,

  /// Extra large
  xl
}

class SupaOffsets {
  static const Offset xs = Offset(0, 360);
  static const Offset s = Offset(361, 768);
  static const Offset m = Offset(769, 1024);
  static const Offset l = Offset(1025, 1200);
  static const Offset xl = Offset(1201, double.infinity);
}

const Map<ScreenSize, Offset> screensizes = {
  ScreenSize.xs: SupaOffsets.xs,
  ScreenSize.s: SupaOffsets.s,
  ScreenSize.m: SupaOffsets.m,
  ScreenSize.l: SupaOffsets.l,
  ScreenSize.xl: SupaOffsets.xl
};

bool isBigAs(double width, ScreenSize screenSize) =>
    screensizes[screenSize]!.inRange(width);

//double to ScreenSize
ScreenSize ssFromWidth(double width) {
  if (width < 0) return ScreenSize.xs;
  return ScreenSize.values
      .firstWhere((element) => screensizes[element]!.inRange(width));
}

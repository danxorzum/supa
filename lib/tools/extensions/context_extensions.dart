import 'package:flutter/material.dart';

import 'package:supa/tools/screen_tools/screen_tools.dart';
import 'package:supa/tools/helpers/helpers_tools.dart';

extension SupaContext on BuildContext {
  Size get supaSize => MediaQuery.of(this).size;

  double get supaWidth => supaSize.width;
  double get supaHeight => supaSize.height;

  TextTheme get textTheme => Theme.of(this).textTheme;

//Screen size bools
  bool get isXs =>
      supaWidth >= SupaOffsets.xs.dx && supaWidth <= SupaOffsets.xs.dy;
  bool get isS =>
      supaWidth >= SupaOffsets.s.dx && supaWidth <= SupaOffsets.s.dy;
  bool get isM =>
      supaWidth >= SupaOffsets.m.dx && supaWidth <= SupaOffsets.m.dy;
  bool get isL =>
      supaWidth >= SupaOffsets.l.dx && supaWidth <= SupaOffsets.l.dy;
  bool get isXl =>
      supaWidth >= SupaOffsets.xl.dx && supaWidth <= SupaOffsets.xl.dy;

//Screen size EdgeInsets
  EdgeInsets get horizontalIns => SupaInsets.horizontal(supaWidth);
  EdgeInsets get verticalIns => SupaInsets.vertical(supaWidth);
  EdgeInsets get allIns => SupaInsets.all(supaWidth);

  EdgeInsets only(
          {bool top = false,
          bool bottom = false,
          bool left = true,
          bool rigth = false}) =>
      SupaInsets.only(supaWidth,
          top: top, bottom: bottom, left: left, rigth: rigth);
}

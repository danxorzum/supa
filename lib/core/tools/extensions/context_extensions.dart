import 'package:flutter/material.dart';

import '../screen_tools/screen_tools.dart';
import '../../helpers/helpers_tools.dart';

extension SupaContext on BuildContext {
  Size get sSize => MediaQuery.of(this).size;

  double get sWidth => sSize.width;
  double get sHeight => sSize.height;

  TextTheme get sTextTheme => Theme.of(this).textTheme;
  ThemeData get sTheme => Theme.of(this);
  ColorScheme get sColorScheme => sTheme.colorScheme;

//Screen size bools
  bool get isXs => sWidth >= SupaOffsets.xs.dx && sWidth <= SupaOffsets.xs.dy;
  bool get isS => sWidth >= SupaOffsets.s.dx && sWidth <= SupaOffsets.s.dy;
  bool get isM => sWidth >= SupaOffsets.m.dx && sWidth <= SupaOffsets.m.dy;
  bool get isL => sWidth >= SupaOffsets.l.dx && sWidth <= SupaOffsets.l.dy;
  bool get isXl => sWidth >= SupaOffsets.xl.dx && sWidth <= SupaOffsets.xl.dy;

//Screen size EdgeInsets
  EdgeInsets get horizontalIns => SupaInsets.horizontal(sWidth);
  EdgeInsets get verticalIns => SupaInsets.vertical(sWidth);
  EdgeInsets get allIns => SupaInsets.all(sWidth);

  EdgeInsets only(
          {bool top = false,
          bool bottom = false,
          bool left = true,
          bool rigth = false}) =>
      SupaInsets.only(sWidth,
          top: top, bottom: bottom, left: left, rigth: rigth);

  //Sized box
  SizedBox get rowSpace => SizedBox(width: SupaInsets.getInsetValue(sWidth));
  SizedBox get columnSpaceLarge =>
      SizedBox(height: SupaInsets.getInsetValue(sWidth * 1.5));
  SizedBox get columnSpace =>
      SizedBox(height: SupaInsets.getInsetValue(sWidth));
  SizedBox get squareBox => SizedBox(
      width: SupaInsets.getInsetValue(sWidth),
      height: SupaInsets.getInsetValue(sWidth));

  //M3 text styles
  TextStyle? get displayL => sTextTheme.displayLarge;
  TextStyle? get display => sTextTheme.displayMedium;
  TextStyle? get displayS => sTextTheme.displaySmall;
  TextStyle? get headlineL => sTextTheme.headlineLarge;
  TextStyle? get headline => sTextTheme.headlineMedium;
  TextStyle? get headlineS => sTextTheme.headlineSmall;
  TextStyle? get titleL => sTextTheme.titleLarge;
  TextStyle? get title => sTextTheme.titleMedium;
  TextStyle? get titleS => sTextTheme.titleSmall;
  TextStyle? get bodyL => sTextTheme.bodyLarge;
  TextStyle? get body => sTextTheme.bodyMedium;
  TextStyle? get bodyS => sTextTheme.bodySmall;
  TextStyle? get labelL => sTextTheme.labelLarge;
  TextStyle? get label => sTextTheme.labelMedium;
  TextStyle? get labelS => sTextTheme.labelSmall;
}

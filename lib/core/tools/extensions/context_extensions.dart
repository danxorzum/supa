part of 'export.dart';

extension SupaContext on BuildContext {
  Size get sSize => MediaQuery.of(this).size;

  double get sWidth => sSize.width;
  double get sHeight => sSize.height;

  //theme
  TextTheme get sTextTheme => Theme.of(this).textTheme;
  ThemeData get sTheme => Theme.of(this);
  ColorScheme get sColorScheme => sTheme.colorScheme;

  SupaHelp get help => SupaHelp(sWidth);

//Screen size bools
  bool get isXs => ScreenSize.xs.offset.isInRange(sWidth);
  bool get isS => ScreenSize.s.offset.isInRange(sWidth);
  bool get isM => ScreenSize.m.offset.isInRange(sWidth);
  bool get isL => ScreenSize.l.offset.isInRange(sWidth);
  bool get isXl => ScreenSize.xl.offset.isInRange(sWidth);

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

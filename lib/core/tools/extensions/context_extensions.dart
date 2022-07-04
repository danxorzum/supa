part of 'export.dart';

extension SupaContext on BuildContext {
  Size get sSize => MediaQuery.of(this).size;

  double get sWidth => sSize.width;
  double get sHeight => sSize.height;

  //SupaThemeData
  SupaThemeData get sTheme => SupaTheme.of(this);
  //theme
  TextTheme get sTextTheme => Theme.of(this).textTheme;
  ColorScheme get colorS => Theme.of(this).colorScheme;

  ///Get your [SupaHelp] its fucking awesome.
  SupaHelp get help => SupaHelp(sSize);

//Screen size bools
  bool get isW => ScreenSize.w.offset.isInRange(sWidth);
  bool get isXs => ScreenSize.xs.offset.isInRange(sWidth);
  bool get isS => ScreenSize.s.offset.isInRange(sWidth);
  bool get isM => ScreenSize.m.offset.isInRange(sWidth);
  bool get isL => ScreenSize.l.offset.isInRange(sWidth);
  bool get isXl => ScreenSize.xl.offset.isInRange(sWidth);

  bool get biggerThanXs => sWidth > ScreenSize.xs.offset.dx;
  bool get biggerThanS => sWidth > ScreenSize.s.offset.dx;
  bool get biggerThanM => sWidth > ScreenSize.m.offset.dx;
  bool get biggerThanL => sWidth > ScreenSize.l.offset.dx;
  bool get biggerThanXl => sWidth > ScreenSize.xl.offset.dx;

  bool get smallerThanXs => sWidth < ScreenSize.xs.offset.dx;
  bool get smallerThanS => sWidth < ScreenSize.s.offset.dx;
  bool get smallerThanM => sWidth < ScreenSize.m.offset.dx;
  bool get smallerThanL => sWidth < ScreenSize.l.offset.dx;
  bool get smallerThanXl => sWidth < ScreenSize.xl.offset.dx;

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

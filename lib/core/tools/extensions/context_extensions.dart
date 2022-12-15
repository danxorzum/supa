part of 'export.dart';

extension SupaContext on BuildContext {
  Size get sSize => MediaQuery.of(this).size;

  double get sWidth => sSize.width;
  double get sHeight => sSize.height;

  //SupaThemeData
  SupaThemeData get sTheme => SupaThemeData.of(this);
  //theme
  SupaTextTheme get sTextTheme => sTheme.textTheme;
  ColorScheme get colorS => Theme.of(this).colorScheme;

  ///Get your [SupaHelp] its fucking awesome.
  SupaHelp get help => AppController.help;

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

  //Supa text styles
  TextStyle get display => sTextTheme.display;
  TextStyle get headline => sTextTheme.headline;
  TextStyle get title => sTextTheme.title;
  TextStyle get body => sTextTheme.body;
  TextStyle get label => sTextTheme.label;
  //M3 text styles

  TextStyle? get mdisplayL => sTextTheme.toMaterial.displayLarge;
  TextStyle? get mdisplay => sTextTheme.toMaterial.displayMedium;
  TextStyle? get mdisplayS => sTextTheme.toMaterial.displaySmall;
  TextStyle? get mheadlineL => sTextTheme.toMaterial.headlineLarge;
  TextStyle? get mheadline => sTextTheme.toMaterial.headlineMedium;
  TextStyle? get mheadlineS => sTextTheme.toMaterial.headlineSmall;
  TextStyle? get mtitleL => sTextTheme.toMaterial.titleLarge;
  TextStyle? get mtitle => sTextTheme.toMaterial.titleMedium;
  TextStyle? get mtitleS => sTextTheme.toMaterial.titleSmall;
  TextStyle? get mbodyL => sTextTheme.toMaterial.bodyLarge;
  TextStyle? get mbody => sTextTheme.toMaterial.bodyMedium;
  TextStyle? get mbodyS => sTextTheme.toMaterial.bodySmall;
  TextStyle? get mlabelL => sTextTheme.toMaterial.labelLarge;
  TextStyle? get mlabel => sTextTheme.toMaterial.labelMedium;
  TextStyle? get mlabelS => sTextTheme.toMaterial.labelSmall;
}

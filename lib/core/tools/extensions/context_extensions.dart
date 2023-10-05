part of 'export.dart';

extension SupaContext on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double get width => size.width;
  double get height => size.height;

  //SupaThemeData
  SupaThemeData get sTheme => SupaThemeData.of(this);
  //theme
  SupaTextTheme get sTextTheme => sTheme.textTheme;
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorS => Theme.of(this).colorScheme;

  ///Get your [SupaHelp] its fucking awesome.
  SupaHelp get help => AppController.help;

  ///Get your [AppController].
  AppController get controller => AppController.instance;

//Screen size bools
  bool get isW => ScreenSize.w.offset.isInRange(width);
  bool get isXs => ScreenSize.xs.offset.isInRange(width);
  bool get isS => ScreenSize.s.offset.isInRange(width);
  bool get isM => ScreenSize.m.offset.isInRange(width);
  bool get isL => ScreenSize.l.offset.isInRange(width);
  bool get isXl => ScreenSize.xl.offset.isInRange(width);

  bool get biggerThanXs => width > ScreenSize.xs.offset.dx;
  bool get biggerThanS => width > ScreenSize.s.offset.dx;
  bool get biggerThanM => width > ScreenSize.m.offset.dx;
  bool get biggerThanL => width > ScreenSize.l.offset.dx;
  bool get biggerThanXl => width > ScreenSize.xl.offset.dx;

  bool get smallerThanXs => width < ScreenSize.xs.offset.dx;
  bool get smallerThanS => width < ScreenSize.s.offset.dx;
  bool get smallerThanM => width < ScreenSize.m.offset.dx;
  bool get smallerThanL => width < ScreenSize.l.offset.dx;
  bool get smallerThanXl => width < ScreenSize.xl.offset.dx;

  bool get isIOS => Platform.isIOS;
  bool get isAndroid => Platform.isAndroid;
  bool get isWindows => Platform.isWindows;
  bool get isMacOS => Platform.isMacOS;
  bool get isLinux => Platform.isLinux;

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

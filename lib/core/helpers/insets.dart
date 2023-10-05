part of 'helpers.dart';

class SupaInsets {
  SupaInsets({
    required this.w,
    required this.xs,
    required this.sm,
    required this.med,
    required this.lg,
    required this.xl,
    required this.screenSize,
  });
  // Regular paddings
  final double w;
  final double xs;
  final double sm;
  final double med;
  final double lg;
  final double xl;
  final ScreenSize screenSize;

  ///Get the right instets value for you screen size
  double getInsetValue() {
    switch (screenSize) {
      case ScreenSize.w:
        return w;
      case ScreenSize.xs:
        return xs;
      case ScreenSize.s:
        return sm;
      case ScreenSize.m:
        return med;
      case ScreenSize.l:
        return lg;
      case ScreenSize.xl:
        return xl;
    }
  }

  ///Get horizontal [EdgeInsets] based on [ScreenSize].
  EdgeInsets horizontal() => EdgeInsets.symmetric(horizontal: getInsetValue());

  ///Get vertical [EdgeInsets] based on [width]
  EdgeInsets vertical() => EdgeInsets.symmetric(vertical: getInsetValue());

  ///Get all [EdgeInsets] based on [width]
  EdgeInsets all({bool isSmall = false}) =>
      EdgeInsets.all(isSmall ? getInsetValue() / 2 : getInsetValue());

  ///Use bools to indicatd witch edge use
  EdgeInsets only(
          {bool top = false,
          bool bottom = false,
          bool left = true,
          bool rigth = false}) =>
      EdgeInsets.only(
          top: top ? getInsetValue() : 0,
          bottom: bottom ? getInsetValue() : 0,
          left: left ? getInsetValue() : 0,
          right: rigth ? getInsetValue() : 0);
}

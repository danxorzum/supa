part of 'helpers.dart';

class SupaCorners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 5;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);

//Get the corner radius for the screen size
  static double getCorner(double width) {
    switch (ScreenSize.whatsSize(width)) {
      case ScreenSize.xs:
      case ScreenSize.s:
        return sm;
      case ScreenSize.m:
        return med;
      case ScreenSize.l:
      case ScreenSize.xl:
        return lg;
      default:
        return 0;
    }
  }

  ///Get the border radius for the screen size
  static BorderRadius getCornerBorder(double width) {
    switch (ScreenSize.whatsSize(width)) {
      case ScreenSize.xs:
      case ScreenSize.s:
        return smBorder;
      case ScreenSize.m:
        return medBorder;
      case ScreenSize.l:
      case ScreenSize.xl:
        return lgBorder;
      default:
        return BorderRadius.zero;
    }
  }

  ///Get the radius for the screen size
  static Radius getCornerRadius(double width) {
    switch (ScreenSize.whatsSize(width)) {
      case ScreenSize.xs:
      case ScreenSize.s:
        return smRadius;
      case ScreenSize.m:
        return medRadius;
      case ScreenSize.l:
      case ScreenSize.xl:
        return lgRadius;
      default:
        return Radius.zero;
    }
  }
}

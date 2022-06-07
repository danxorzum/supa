part of 'helpers.dart';

class SupaInsets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 10 * scale;
  static double get sm => 20 * scale;
  static double get med => 25 * scale;
  static double get lg => 30 * scale;
  static double get xl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get spacer => 40 * offsetScale;

  ///Get the right instets value for you screen size
  static double getInsetValue(double width) {
    switch (ScreenSize.whatsSize(width)) {
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
      default:
        return 0;
    }
  }

  ///Get horizontal [EdgeInsets] based on [width]
  static EdgeInsets horizontal(double width) {
    switch (ScreenSize.whatsSize(width)) {
      case ScreenSize.xs:
        return EdgeInsets.symmetric(horizontal: xs);
      case ScreenSize.s:
        return EdgeInsets.symmetric(horizontal: sm);
      case ScreenSize.m:
        return EdgeInsets.symmetric(horizontal: med);
      case ScreenSize.l:
        return EdgeInsets.symmetric(horizontal: lg);
      case ScreenSize.xl:
        return EdgeInsets.symmetric(horizontal: xl);
    }
  }

  ///Get vertical [EdgeInsets] based on [width]
  static EdgeInsets vertical(double width) {
    switch (ScreenSize.whatsSize(width)) {
      case ScreenSize.xs:
        return EdgeInsets.symmetric(vertical: xs);
      case ScreenSize.s:
        return EdgeInsets.symmetric(vertical: sm);
      case ScreenSize.m:
        return EdgeInsets.symmetric(vertical: med);
      case ScreenSize.l:
        return EdgeInsets.symmetric(vertical: lg);
      case ScreenSize.xl:
        return EdgeInsets.symmetric(vertical: xl);
    }
  }

  ///Get all [EdgeInsets] based on [width]
  static EdgeInsets all(double width, {bool isSmall = false}) {
    switch (ScreenSize.whatsSize(width)) {
      case ScreenSize.xs:
        return EdgeInsets.all(isSmall ? xs / 2 : xs);
      case ScreenSize.s:
        return EdgeInsets.all(isSmall ? sm / 2 : sm);
      case ScreenSize.m:
        return EdgeInsets.all(isSmall ? med / 2 : med);
      case ScreenSize.l:
        return EdgeInsets.all(isSmall ? lg / 2 : lg);
      case ScreenSize.xl:
        return EdgeInsets.all(isSmall ? xl / 2 : xl);
    }
  }

  ///Use bools to indicatd witch edge use
  static EdgeInsets only(double width,
      {bool top = false,
      bool bottom = false,
      bool left = true,
      bool rigth = false}) {
    switch (ScreenSize.whatsSize(width)) {
      case ScreenSize.xs:
        return EdgeInsets.only(
            top: top ? xs : 0.0,
            bottom: bottom ? xs : 0.0,
            left: left ? xs : 0.0,
            right: rigth ? xs : 0.0);
      case ScreenSize.s:
        return EdgeInsets.only(
            top: top ? sm : 0.0,
            bottom: bottom ? sm : 0.0,
            left: left ? sm : 0.0,
            right: rigth ? sm : 0.0);
      case ScreenSize.m:
        return EdgeInsets.only(
            top: top ? med : 0.0,
            bottom: bottom ? med : 0.0,
            left: left ? med : 0.0,
            right: rigth ? med : 0.0);
      case ScreenSize.l:
        return EdgeInsets.only(
            top: top ? lg : 0.0,
            bottom: bottom ? lg : 0.0,
            left: left ? lg : 0.0,
            right: rigth ? lg : 0.0);
      case ScreenSize.xl:
        return EdgeInsets.only(
            top: top ? xl : 0.0,
            bottom: bottom ? xl : 0.0,
            left: left ? xl : 0.0,
            right: rigth ? xl : 0.0);
    }
  }
}

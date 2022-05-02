import 'package:supa/supa.dart';

class SupaSettings {
  late final SupaTextSize _textSizes;
  final double? scaleExtraSmall;
  final double? scaleMedium;
  final double? scaleLarge;
  final double? scaleExtraLarge;

  SupaTextSize get textSizes => _textSizes;

  SupaSettings._({
    SupaTextSize? textSizes,
    this.scaleExtraSmall,
    this.scaleMedium,
    this.scaleLarge,
    this.scaleExtraLarge,
  }) {
    _textSizes = textSizes ?? SupaTextSize();
  }

  ///Fast setup for SupaSettings.
  ///Configure only what you need.
  factory SupaSettings.fast(
      {double scaleExtraSmall = 0.95,
      double scaleMedium = 1.05,
      double scaleLarge = 1.1,
      double scaleExtraLarge = 1.2}) {
    return SupaSettings._(
      textSizes: SupaTextSize(),
      scaleExtraSmall: scaleExtraSmall,
      scaleMedium: scaleMedium,
      scaleLarge: scaleLarge,
      scaleExtraLarge: scaleExtraLarge,
    );
  }

  ///Create a [SupaSettings] with an optional [SupaTextSize].
  ///All the [ScreenSize]'s will be the same [fontSizes].
  factory SupaSettings.flat({SupaTextSize? textSizes}) {
    return SupaSettings._(
      textSizes: textSizes,
    );
  }

  ///Custom text sizes.
  ///You can configure the text sizes and the scales.
  ///
  ///Default values are: null
  ///
  ///Values has to be greater than 0.
  factory SupaSettings.custom({
    SupaTextSize? textSizes,
    double? scaleExtraSmall,
    double? scaleMedium,
    double? scaleLarge,
    double? scaleExtraLarge,
  }) {
    assert(
        (scaleExtraSmall ?? 1) > 0 &&
            (scaleMedium ?? 1) > 0 &&
            (scaleLarge ?? 1) > 0 &&
            (scaleExtraLarge ?? 1) > 0,
        'The scales must be greater than 0');

    return SupaSettings._(
      textSizes: textSizes,
      scaleExtraSmall: scaleExtraSmall,
      scaleMedium: scaleMedium,
      scaleLarge: scaleLarge,
      scaleExtraLarge: scaleExtraLarge,
    );
  }

  SupaTextSize reSize(ScreenSize ss, double fontScale) {
    switch (ss) {
      case ScreenSize.xs:
        return _textSizes._scaleFontSize((scaleExtraSmall ?? 1) * fontScale);
      case ScreenSize.s:
        return _textSizes._scaleFontSize(fontScale);
      case ScreenSize.m:
        return _textSizes._scaleFontSize((scaleMedium ?? 1) * fontScale);
      case ScreenSize.l:
        return _textSizes._scaleFontSize((scaleLarge ?? 1) * fontScale);
      case ScreenSize.xl:
        return _textSizes._scaleFontSize((scaleExtraLarge ?? 1) * fontScale);
    }
  }
}

class SupaTextSize {
  ///Diferente Screens fonts
  SupaTextSize({
    this.overline = 10,
    this.caption = 12,
    this.button = 14,
    this.bodyText2 = 14,
    this.bodyText1 = 16,
    this.subtitle2 = 14,
    this.subtitle1 = 16,
    this.headline6 = 20,
    this.headline5 = 24,
    this.headline4 = 34,
    this.headline3 = 48,
    this.headline2 = 60,
    this.headline1 = 96,
  });
  // overline
  final double overline;
  // caption
  final double caption;
  // button
  final double button;
  // bodyText2
  final double bodyText2;
  // bodyText1
  final double bodyText1;
  //subtitle2
  final double subtitle2;
  //subtitle1
  final double subtitle1;
  // headline6
  final double headline6;
  // headline5
  final double headline5;
  // headline4
  final double headline4;
  // headline3
  final double headline3;
  // headline2
  final double headline2;
  // headline1
  final double headline1;

  SupaTextSize _scaleFontSize(double size) => SupaTextSize(
        overline: overline * size,
        caption: caption * size,
        button: button * size,
        bodyText2: bodyText2 * size,
        bodyText1: bodyText1 * size,
        subtitle2: subtitle2 * size,
        subtitle1: subtitle1 * size,
        headline6: headline6 * size,
        headline5: headline5 * size,
        headline4: headline4 * size,
        headline3: headline3 * size,
        headline2: headline2 * size,
        headline1: headline1 * size,
      );
}

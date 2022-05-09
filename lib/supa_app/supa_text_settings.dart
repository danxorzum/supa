class SupaTextSettings {
  final TextThemeScales textThemeScales;

  SupaTextSettings({
    required this.textThemeScales,
  });

  // ///Fast setup for SupaSettings with material 2.
  // ///Configure only what you need.
  // factory SupaTextSettings.fastM2(
  //     {double? scaleExtraSmall = 0.95,
  //     double? scaleMedium = 1.05,
  //     double? scaleLarge = 1.1,
  //     double? scaleExtraLarge = 1.2}) {
  //   return SupaTextSettings._(
  //     textSizes: M2TextThemeScales(),
  //     scaleExtraSmall: scaleExtraSmall,
  //     scaleMedium: scaleMedium,
  //     scaleLarge: scaleLarge,
  //     scaleExtraLarge: scaleExtraLarge,
  //   );
  // }

  // ///Fast setup for SupaSettings with material .
  // ///Configure only what you need.
  // factory SupaTextSettings.fast() {
  //   return SupaTextSettings._(m3textThemeConfigure: TextThemeScales());
  // }

  // ///Create a [SupaTextSettings] with an optional [M2TextThemeScales].
  // ///All the [ScreenSize]'s will be the same [fontSizes].
  // factory SupaTextSettings.flat({M2TextThemeScales? textSizes}) {
  //   return SupaTextSettings._(
  //     textSizes: textSizes,
  //   );
  // }

  // ///Custom text sizes.
  // ///You can configure the text sizes and the scales.
  // ///
  // ///Default values are: null
  // ///
  // ///Values has to be greater than 0.
  // factory SupaTextSettings.custom({
  //   M2TextThemeScales? textSizes,
  //   double? scaleExtraSmall,
  //   double? scaleMedium,
  //   double? scaleLarge,
  //   double? scaleExtraLarge,
  // }) {
  //   assert(
  //       (scaleExtraSmall ?? 1) > 0 &&
  //           (scaleMedium ?? 1) > 0 &&
  //           (scaleLarge ?? 1) > 0 &&
  //           (scaleExtraLarge ?? 1) > 0,
  //       'The scales must be greater than 0');

  //   return SupaTextSettings._(
  //     textSizes: textSizes,
  //     scaleExtraSmall: scaleExtraSmall,
  //     scaleMedium: scaleMedium,
  //     scaleLarge: scaleLarge,
  //     scaleExtraLarge: scaleExtraLarge,
  //   );
  // }

  // M2TextThemeScales reSize(ScreenSize ss, double fontScale) {
  //   switch (ss) {
  //     case ScreenSize.xs:
  //       return textSizes!._scaleFontSize((scaleExtraSmall ?? 1) * fontScale);
  //     case ScreenSize.s:
  //       return textSizes!._scaleFontSize(fontScale);
  //     case ScreenSize.m:
  //       return textSizes!._scaleFontSize((scaleMedium ?? 1) * fontScale);
  //     case ScreenSize.l:
  //       return textSizes!._scaleFontSize((scaleLarge ?? 1) * fontScale);
  //     case ScreenSize.xl:
  //       return textSizes!._scaleFontSize((scaleExtraLarge ?? 1) * fontScale);
  //   }
  // }
}

// class M2TextThemeScales {
//   ///Diferente Screens fonts
//   M2TextThemeScales({
//     this.overline = 10,
//     this.caption = 12,
//     this.button = 14,
//     this.bodyText2 = 14,
//     this.bodyText1 = 16,
//     this.subtitle2 = 14,
//     this.subtitle1 = 16,
//     this.headline6 = 20,
//     this.headline5 = 24,
//     this.headline4 = 34,
//     this.headline3 = 48,
//     this.headline2 = 60,
//     this.headline1 = 96,
//   });
//   // overline
//   final double overline;
//   // caption
//   final double caption;
//   // button
//   final double button;
//   // bodyText2
//   final double bodyText2;
//   // bodyText1
//   final double bodyText1;
//   //subtitle2
//   final double subtitle2;
//   //subtitle1
//   final double subtitle1;
//   // headline6
//   final double headline6;
//   // headline5
//   final double headline5;
//   // headline4
//   final double headline4;
//   // headline3
//   final double headline3;
//   // headline2
//   final double headline2;
//   // headline1
//   final double headline1;

//   M2TextThemeScales _scaleFontSize(double size) => M2TextThemeScales(
//         overline: overline * size,
//         caption: caption * size,
//         button: button * size,
//         bodyText2: bodyText2 * size,
//         bodyText1: bodyText1 * size,
//         subtitle2: subtitle2 * size,
//         subtitle1: subtitle1 * size,
//         headline6: headline6 * size,
//         headline5: headline5 * size,
//         headline4: headline4 * size,
//         headline3: headline3 * size,
//         headline2: headline2 * size,
//         headline1: headline1 * size,
//       );
// }

class TextThemeScales {
  final double xsScale;
  final double xsBigScale;
  final double mScale;
  final double lScale;
  final double xlScale;

  TextThemeScales(
      {this.xsScale = 0.95,
      this.xsBigScale = 0.75,
      this.mScale = 1.05,
      this.lScale = 1.15,
      this.xlScale = 1.2});
}

import 'package:flutter/material.dart';

import 'supa_child.dart';
import 'app_controller.dart';

extension SupaAppExtension on BuildContext {
  AppController get appController => SupaChild.of(this).controller;
}

extension SupaTextStyleExtension on TextStyle {
  TextStyle scale(double scale, {double deviceTextScaleFactor = 1}) {
    return copyWith(
      fontSize:
          fontSize != null ? fontSize! * scale * deviceTextScaleFactor : null,
      height: height != null ? height! * scale * deviceTextScaleFactor : null,
    );
  }
}

extension SupaTextThemeExtension on TextTheme {
  TextTheme scale(double scale, {double deviceTextScaleFactor = 1}) {
    return copyWith(
      bodyText1:
          bodyText1?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      bodyText2:
          bodyText2?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      button:
          button?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      caption:
          caption?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      overline:
          overline?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      subtitle1:
          subtitle1?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      subtitle2:
          subtitle2?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      headline6:
          headline6?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      headline5:
          headline5?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      headline4:
          headline4?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      headline3:
          headline3?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      headline2:
          headline2?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      headline1:
          headline1?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      displayLarge: displayLarge?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      displayMedium: displayMedium?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      displaySmall: displaySmall?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      headlineLarge: headlineLarge?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      headlineMedium: headlineMedium?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      headlineSmall: headlineSmall?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      titleLarge: titleLarge?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      titleMedium: titleMedium?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      titleSmall: titleSmall?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      labelLarge: labelLarge?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      labelMedium: labelMedium?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      labelSmall: labelSmall?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      bodyLarge:
          bodyLarge?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
      bodyMedium: bodyMedium?.scale(scale,
          deviceTextScaleFactor: deviceTextScaleFactor),
      bodySmall:
          bodySmall?.scale(scale, deviceTextScaleFactor: deviceTextScaleFactor),
    );
  }
}

import 'package:screen/src/models/models.dart';

///Extension for [SupaInsets].
///
///This extension is used to get the horizontal or vertical
///insets for the given [SupaDevice].
extension InsetsExtension on SupaInsets {
  ///Get the horizontal insets for the given device
  ///using [SupaDevice]
  double getHorizontalInsValue(SupaDevice device) {
    switch (device.screenType) {
      case ScreenSize.watch:
        if (device.orientation == DeviceOrientation.portraitUp ||
            device.orientation == DeviceOrientation.portraitDown) {
          return watchHorizontal;
        } else {
          return watchVertical;
        }
      case ScreenSize.extraSmall:
        if (device.orientation == DeviceOrientation.portraitUp ||
            device.orientation == DeviceOrientation.portraitDown) {
          return extraSmallHorizontal;
        } else {
          return extraSmallVertical;
        }
      case ScreenSize.small:
        if (device.orientation == DeviceOrientation.portraitUp ||
            device.orientation == DeviceOrientation.portraitDown) {
          return smallHorizontal;
        } else {
          return smallVertical;
        }
      case ScreenSize.medium:
        if (device.orientation == DeviceOrientation.portraitUp ||
            device.orientation == DeviceOrientation.portraitDown) {
          return mediumHorizontal;
        } else {
          return mediumVertical;
        }
      case ScreenSize.large:
        if (device.orientation == DeviceOrientation.portraitUp ||
            device.orientation == DeviceOrientation.portraitDown) {
          return largeHorizontal;
        } else {
          return largeVertical;
        }
      case ScreenSize.extraLarge:
        if (device.orientation == DeviceOrientation.portraitUp ||
            device.orientation == DeviceOrientation.portraitDown) {
          return extraLargeHorizontal;
        } else {
          return extraLargeVertical;
        }
    }
  }
}

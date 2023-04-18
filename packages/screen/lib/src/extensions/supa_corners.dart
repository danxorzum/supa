import 'package:flutter/rendering.dart';
import 'package:screen/src/models/models.dart';

/// Extension for [SupaCorners].
/// Add functionality to [SupaCorners] to get the corner
/// radius for a given [SupaDevice].
extension CornerExtension on SupaCorners {
  /// Returns the corner radius for the given [SupaDevice].
  double getRadius(SupaDevice device) {
    switch (device.screenType) {
      case ScreenSize.watch:
        return watch;
      case ScreenSize.extraSmall:
        return extraSmall;
      case ScreenSize.small:
        return small;
      case ScreenSize.medium:
        return medium;
      case ScreenSize.large:
        return large;
      case ScreenSize.extraLarge:
        return extraLarge;
    }
  }

  /// Returns the circular [Radius] for the given [SupaDevice].
  ///
  /// [Radius] is Radius.circular.
  Radius getRadiusFromDevice(SupaDevice device) =>
      Radius.circular(getRadius(device));

  /// Returns the [BorderRadius] for the given [SupaDevice].
  ///
  /// [BorderRadius] is BorderRadius.all.
  BorderRadius getBorderRadiusFromDevice(SupaDevice device) =>
      BorderRadius.all(getRadiusFromDevice(device));
}

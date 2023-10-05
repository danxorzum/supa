part of 'helpers.dart';

class SupaCorners {
  ///Get the corner radius for your screen size.
  const SupaCorners(
      {required this.screenSize,
      required this.sm,
      required this.med,
      required this.lg});

  ///Corner value to calculte small [Radius] and [BorderRadius].
  final double sm;

  ///Corner value to calculte medium [Radius] and [BorderRadius].
  final double med;

  ///Corner value to calculte large [Radius] and [BorderRadius].
  final double lg;

  ///wich [ScreenSize] use to get the [Radius] or [BorderRadius].
  final ScreenSize screenSize;

  ///Get the corner value for your [ScreenSize].
  double getCorner() {
    switch (screenSize) {
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

  ///Get the circular [Radius] for your [ScreenSize].
  Radius getCircularRadius() => Radius.circular(getCorner());

  ///Get the elliptical [Radius] for your [ScreenSize].
  Radius getElipticalRadius(double y) => Radius.elliptical(getCorner(), y);

  ///Get the circular [BorderRadius] for your [ScreenSize].
  BorderRadius getCircularBorderRadius() => BorderRadius.circular(getCorner());

  ///Get [BorderRadius].all for your [ScreenSize].
  BorderRadius getAllBorderRadius() => BorderRadius.all(getCircularRadius());

  ///Get horizontal [BorderRadius] for your [ScreenSize].
  BorderRadius getHorizontalBorderRadius() {
    final radius = getCircularRadius();
    return BorderRadius.horizontal(left: radius, right: radius);
  }

  ///Get vertical [BorderRadius] for your [ScreenSize].
  BorderRadius getVerticalBorderRadius() {
    final radius = getCircularRadius();
    return BorderRadius.vertical(top: radius, bottom: radius);
  }

  ///Get [BorderRadius] only for your [ScreenSize].
  ///[topLeft] [topRight] [bottomLeft] [bottomRight] are [bool]s to set the [Radius] or [Radius.zero].
  BorderRadius getBorderRadiusOnly(
      {bool topLeft = false,
      bool topRight = false,
      bool bottomLeft = false,
      bool bottomRight = false}) {
    final radius = getCircularRadius();
    return BorderRadius.only(
        topLeft: topLeft ? radius : Radius.zero,
        topRight: topRight ? radius : Radius.zero,
        bottomLeft: bottomLeft ? radius : Radius.zero,
        bottomRight: bottomRight ? radius : Radius.zero);
  }
}

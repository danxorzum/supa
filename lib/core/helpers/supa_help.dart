part of 'helpers.dart';

class SupaHelp {
  /// Your supa help!
  /// Call [context.help] to get it.
  /// Obtain resposive help for your app.
  ///
  /// Give your[width] and thast it.
  /// Obtain lot of tools for your app, like [Radius], [BorderRadius], [EdgeInsets], [SizedBox] etc.
  SupaHelp(this.width) {
    horizontalIns = SupaInsets.horizontal(width);
    verticalIns = SupaInsets.vertical(width);
    allIns = SupaInsets.all(width);
    columnSpaceLarge = SizedBox(height: SupaInsets.getInsetValue(width * 1.5));
    columnSpace = SizedBox(height: SupaInsets.getInsetValue(width));
    columnSpaceSmall = SizedBox(height: SupaInsets.getInsetValue(width * 0.5));
    rowSpaceLarge = SizedBox(width: SupaInsets.getInsetValue(width * 1.5));
    rowSpace = SizedBox(width: SupaInsets.getInsetValue(width));
    rowSpaceSmall = SizedBox(width: SupaInsets.getInsetValue(width * 0.5));
    corner = SupaCorners.getCorner(width);
    radius = Radius.circular(SupaCorners.getCorner(width));
    borderRadius = BorderRadius.circular(SupaCorners.getCorner(width));
  }

  final double width;

  /// Responsive [EdgeInsets.symmetric] using [horizontal].
  late final EdgeInsets horizontalIns;

  /// Responsive [EdgeInsets.symmetric] using [vertical].
  late final EdgeInsets verticalIns;

  /// Responsive [EdgeInsets.all].
  late final EdgeInsets allIns;

  /// Responsive large [SizedBox] using [height].
  late final SizedBox columnSpaceLarge;

  /// Responsive [SizedBox] using [height].
  late final SizedBox columnSpace;

  /// Responsive small [SizedBox] using [height].
  late final SizedBox columnSpaceSmall;

  /// Responsive large [SizedBox] using [width].
  late final SizedBox rowSpaceLarge;

  /// Responsive [SizedBox] using [width].
  late final SizedBox rowSpace;

  /// Responsive small [SizedBox] using [width].
  late final SizedBox rowSpaceSmall;

  /// Responsive [double] for corners.
  late final double corner;

  /// Responsive [Radius].
  late final Radius radius;

  /// Responsive [BorderRadius].
  late final BorderRadius borderRadius;

  /// Responsive [EdgeInsets.only]
  /// use [top], [left], [bottom], [right] bools to set wich sides use.
  /// for default use only [left]
  EdgeInsets only(
          {bool top = false,
          bool bottom = false,
          bool left = true,
          bool rigth = false}) =>
      SupaInsets.only(width,
          top: top, bottom: bottom, left: left, rigth: rigth);
}

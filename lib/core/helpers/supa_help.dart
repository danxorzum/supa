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
    allInsSmall = SupaInsets.all(width, isSmall: true);
    insValue = SupaInsets.getInsetValue(width);
    insValueLarge = insValue * 1.5;
    insValueSmall = insValue * 0.5;
    columnSpaceLarge = SizedBox(height: insValueLarge);
    columnSpace = SizedBox(height: insValue);
    columnSpaceSmall = SizedBox(height: insValueSmall);
    rowSpaceLarge = SizedBox(width: insValueLarge);
    rowSpace = SizedBox(width: insValue);
    rowSpaceSmall = SizedBox(width: insValueSmall);
    corner = SupaCorners.getCorner(width);
    radius = Radius.circular(corner);
    borderRadius = BorderRadius.circular(corner);
  }

  final double width;

  /// Responsive [EdgeInsets.symmetric] using [horizontal].
  late final EdgeInsets horizontalIns;

  /// Responsive [EdgeInsets.symmetric] using [vertical].
  late final EdgeInsets verticalIns;

  /// Responsive [EdgeInsets.all].
  late final EdgeInsets allIns;

  /// Responsive [EdgeInsets.all].
  late final EdgeInsets allInsSmall;

  /// Responsive [double] based on [SupaInsets.getInsetValue].
  late final double insValueLarge;

  /// Responsive [double] based on [SupaInsets.getInsetValue].
  late final double insValue;

  /// Responsive [double] based on [SupaInsets.getInsetValue].
  late final double insValueSmall;

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
          bool left = false,
          bool rigth = false}) =>
      SupaInsets.only(width,
          top: top, bottom: bottom, left: left, rigth: rigth);
}

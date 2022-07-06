part of 'helpers.dart';

class SupaHelp {
  /// Your supa help!
  /// Call [context.help] to get it.
  /// Obtain resposive help for your app.
  ///
  /// Give your[size] and thast it.
  /// Obtain lot of tools for your app, like [Radius], [BorderRadius], [EdgeInsets], [SizedBox] etc.
  SupaHelp(this.size) {
    horizontalIns = SupaInsets.horizontal(size.width);
    verticalIns = SupaInsets.vertical(size.width);
    allIns = SupaInsets.all(size.width);
    allInsSmall = SupaInsets.all(size.width, isSmall: true);
    insValue = SupaInsets.getInsetValue(size.width);
    insValueLarge = insValue * 1.5;
    insValueSmall = insValue * 0.5;
    columnSpaceLarge = SizedBox(height: insValueLarge);
    columnSpace = SizedBox(height: insValue);
    columnSpaceSmall = SizedBox(height: insValueSmall);
    rowSpaceLarge = SizedBox(width: insValueLarge);
    rowSpace = SizedBox(width: insValue);
    rowSpaceSmall = SizedBox(width: insValueSmall);
    corner = SupaCorners.getCorner(size.width);
    radius = Radius.circular(corner);
    borderRadius = BorderRadius.circular(corner);
    screenSize = ScreenSize.whatsSize(size.width);
  }

  /// Your viewport size
  final Size size;

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

  /// Responsive large [SizedBox] using [size].
  late final SizedBox rowSpaceLarge;

  /// Responsive [SizedBox] using [size].
  late final SizedBox rowSpace;

  /// Responsive small [SizedBox] using [size].
  late final SizedBox rowSpaceSmall;

  /// Responsive [double] for corners.
  late final double corner;

  /// Responsive [Radius].
  late final Radius radius;

  /// Responsive [BorderRadius].
  late final BorderRadius borderRadius;

  ///Screen size for the device.
  late final ScreenSize screenSize;

  /// Responsive [EdgeInsets.only]
  /// use [top], [left], [bottom], [right] bools to set wich sides use.
  /// for default use only [left]
  EdgeInsets only(
          {bool top = false,
          bool bottom = false,
          bool left = false,
          bool rigth = false}) =>
      SupaInsets.only(size.width,
          top: top, bottom: bottom, left: left, rigth: rigth);

  SupaDevice get device => SupaDevice.getDevice(size);
}

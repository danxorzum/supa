part of 'helpers.dart';

class SupaHelp {
  /// Your supa help!
  /// Call [context.help] to get it.
  /// Obtain resposive help for your app.
  ///
  /// Give your[size] and thast it.
  /// Obtain lot of tools for your app, like [Radius], [BorderRadius], [EdgeInsets], [SizedBox] etc.
  SupaHelp({required this.settings, required this.size}) {
    screenSize = ScreenSize.whatsSize(size.width);
    ins = SupaInsets(
        w: settings.wIns,
        xs: settings.xsIns,
        xl: settings.xlIns,
        lg: settings.lgIns,
        med: settings.medIns,
        sm: settings.smIns,
        screenSize: screenSize);
    horizontalIns = ins.horizontal();
    verticalIns = ins.vertical();
    allIns = ins.all();
    allInsSmall = ins.all(isSmall: true);
    insValue = ins.getInsetValue();
    insValueLarge = insValue * 1.5;
    insValueSmall = insValue * 0.5;
    columnSpaceLarge = SizedBox(height: insValueLarge);
    columnSpace = SizedBox(height: insValue);
    columnSpaceSmall = SizedBox(height: insValueSmall);
    rowSpaceLarge = SizedBox(width: insValueLarge);
    rowSpace = SizedBox(width: insValue);
    rowSpaceSmall = SizedBox(width: insValueSmall);
    corner = SupaCorners(
        lg: settings.lgCor,
        med: settings.medCor,
        sm: settings.smCor,
        screenSize: screenSize);
    radius = corner.getCircularRadius();
    borderRadius = corner.getCircularBorderRadius();
    device = SupaDevice.getDevice(size);
    screenDevice = SupaDevice.getDeviceFromSize(size);
  }

  /// Your viewport size
  final Size size;

  ///Your [SupaSettings] for your app.
  final SupaSettings settings;

  late final SupaInsets ins;

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
  late final SupaCorners corner;

  /// Responsive [Radius].
  late final Radius radius;

  /// Responsive [BorderRadius].
  late final BorderRadius borderRadius;

  ///Screen size for the device.
  late final ScreenSize screenSize;

  /// current device taking the OS and the orientation.
  late final SupaDevice device;

  /// Current relative device based on the [size] ignoring the OS.
  late final SupaDevice screenDevice;

  /// Responsive [EdgeInsets.only]
  /// use [top], [left], [bottom], [right] bools to set wich sides use.
  /// for default use only [left]
  EdgeInsets only(
          {bool top = false,
          bool bottom = false,
          bool left = false,
          bool rigth = false}) =>
      ins.only(top: top, bottom: bottom, left: left, rigth: rigth);
}

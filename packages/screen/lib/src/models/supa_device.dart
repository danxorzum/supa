import 'package:flutter/services.dart';

/// Diferent sizes for the app
const _w = 300;
const _xs = 360;
const _s = 599;
const _m = 1024;
const _l = 1200;

/// Diferent Screen Sizes
enum ScreenSize {
  ///Watch

  watch,

  /// Extra small
  extraSmall,

  /// Small
  small,

  /// Medium
  medium,

  /// Large
  large,

  /// Extra large
  extraLarge,
}

/// Device Type
enum Device {
  /// Watch
  watch,

  /// Phone
  phone,

  /// Tablet
  tablet,

  /// Desktop
  desktop,
}

/// Device OS
enum OS {
  /// Android
  android,

  /// iOS
  ios,

  /// Web
  web,

  /// Fuchsia
  fuchsia,

  /// Windows
  windows,

  /// Linux
  linux,

  /// MacOS
  macOS,
}

///{@template supa_device}
/// A class that contains all the information about the device.
///
/// You can handle all Adaptive and Responsive UI with this class.
/// Supa handles all the information about the device and gives you the
/// information you need.
///
/// Don't use this class directly, almost you won't use Supa.
class SupaDevice {
  ///{@macro supa_device}
  /// Creates a new instance of [SupaDevice].
  /// Receives the [Size] [ScreenSize], [DeviceOrientation], [Device] and [OS].
  /// Important the [Size] has to be in Dp.
  factory SupaDevice.fromSize({
    required Size size,
    required Device device,
    required DeviceOrientation orientation,
    required OS deviceOS,
  }) {
    final sT = calculateScreenSize(size);
    return SupaDevice(
      screenType: sT,
      orientation: orientation,
      device: device,
      deviceOS: deviceOS,
      screenSize: size,
    );
  }

  ///{@macro supa_device}
  const SupaDevice({
    required this.screenType,
    required this.orientation,
    required this.device,
    required this.deviceOS,
    required this.screenSize,
  });

  ///Current Screen.
  ///If the device can change the screen size, like web, you should update this
  ///value.
  ///
  ///Supa will handle this automatically.
  final ScreenSize screenType;

  /// Current Device Orientation
  /// If the device can change the orientation, like mobile, you should update
  /// this value.
  ///
  /// Supa will handle this automatically.
  final DeviceOrientation orientation;

  /// Current Device Type
  final Device device;

  /// Current Device OS
  final OS deviceOS;

  /// Current Screen Size.
  ///
  /// If the device can change the screen size, like web, you should update this
  /// value.
  ///
  /// Supa will handle this automatically.
  final Size screenSize;

  /// Calculates the [ScreenSize] from the [Size]
  static ScreenSize calculateScreenSize(Size size) {
    final bigger = size.width > size.height ? size.width : size.height;
    if (bigger <= _w) return ScreenSize.watch;
    if (bigger <= _xs) return ScreenSize.extraSmall;
    if (bigger <= _s) return ScreenSize.small;
    if (bigger <= _m) return ScreenSize.medium;
    if (bigger <= _l) return ScreenSize.large;
    return ScreenSize.extraLarge;
  }
}

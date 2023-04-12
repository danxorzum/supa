// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen/src/models/supa_device.dart';

void main() {
  //phones portrait
  ///large
  final iphone11Pro = Size(375, 812);
  final iphone11 = Size(375, 667);
  final iphone12mini = Size(360, 780);
  final s21Ultra = Size(360, 800);
  final s21 = Size(360, 740);
  final pixel4a = Size(360, 760);

  //phones landscape
  final iphone11ProLandscape = Size(812, 375);
  final iphone11Landscape = Size(667, 375);
  final iphone12miniLandscape = Size(780, 360);
  final s21UltraLandscape = Size(800, 360);
  final s21Landscape = Size(740, 360);
  final pixel4aLandscape = Size(760, 360);

  //tablets portrait
  final ipadPro11 = Size(834, 1194);
  final ipadPro12 = Size(1024, 1366);
  final samsungTabS7 = Size(834, 1194);
  final samsungTabS6 = Size(834, 1112);
  final samsungTabS5 = Size(800, 1280);

  //tablets landscape
  final ipadPro11Landscape = Size(1194, 834);
  final ipadPro12Landscape = Size(1366, 1024);
  final samsungTabS7Landscape = Size(1194, 834);
  final samsungTabS6Landscape = Size(1112, 834);
  final samsungTabS5Landscape = Size(1280, 800);

  //desktops
  final macbookPro = Size(1440, 900);
  final macbook = Size(1280, 800);
  final imac = Size(2560, 1440);
  final imacPro = Size(5120, 2880);

  //watch on dp
  final appleWatch = Size(250, 250);
  final otherWatch = Size(300, 300);

  group('SupaScreen', () {
    test('can be instantiated', () {
      expect(
        SupaDevice(
          device: Device.phone,
          deviceOS: OS.android,
          orientation: DeviceOrientation.landscapeLeft,
          screenSize: Size(500, 700),
          screenType: ScreenSize.medium,
        ),
        isNotNull,
      );
    });
  });
  group('from size portrait', () {
    test('iphone 11 pro', () {
      expect(
        SupaDevice.fromSize(
          size: iphone11Pro,
          device: Device.phone,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('iphone 11', () {
      expect(
        SupaDevice.fromSize(
          size: iphone11,
          device: Device.phone,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('iphone 12 mini', () {
      expect(
        SupaDevice.fromSize(
          size: iphone12mini,
          device: Device.phone,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('samsung s21 ultra', () {
      expect(
        SupaDevice.fromSize(
          size: s21Ultra,
          device: Device.phone,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('samsung s21', () {
      expect(
        SupaDevice.fromSize(
          size: s21,
          device: Device.phone,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('pixel 4a', () {
      expect(
        SupaDevice.fromSize(
          size: pixel4a,
          device: Device.phone,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('ipad pro 11', () {
      expect(
        SupaDevice.fromSize(
          size: ipadPro11,
          device: Device.tablet,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.large,
      );
    });
    test('ipad pro 12', () {
      expect(
        SupaDevice.fromSize(
          size: ipadPro12,
          device: Device.tablet,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
    test('samsung tab s7', () {
      expect(
        SupaDevice.fromSize(
          size: samsungTabS7,
          device: Device.tablet,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.large,
      );
    });
    test('samsung tab s6', () {
      expect(
        SupaDevice.fromSize(
          size: samsungTabS6,
          device: Device.tablet,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.large,
      );
    });
    test('samsung tab s5', () {
      expect(
        SupaDevice.fromSize(
          size: samsungTabS5,
          device: Device.tablet,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
    test('macbook pro', () {
      expect(
        SupaDevice.fromSize(
          size: macbookPro,
          device: Device.desktop,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.macOS,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
    test('macbook', () {
      expect(
        SupaDevice.fromSize(
          size: macbook,
          device: Device.desktop,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.macOS,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
    test('imac', () {
      expect(
        SupaDevice.fromSize(
          size: imac,
          device: Device.desktop,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.macOS,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
    test('imac pro', () {
      expect(
        SupaDevice.fromSize(
          size: imacPro,
          device: Device.desktop,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.macOS,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
  });
  group('from size landscape', () {
    test('iphone 11 pro landscape', () {
      expect(
        SupaDevice.fromSize(
          size: iphone11ProLandscape,
          device: Device.phone,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('iphone 11 landscape', () {
      expect(
        SupaDevice.fromSize(
          size: iphone11Landscape,
          device: Device.phone,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('iphone 12 mini landscape', () {
      expect(
        SupaDevice.fromSize(
          size: iphone12miniLandscape,
          device: Device.phone,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('samsung s21 ultra landscape', () {
      expect(
        SupaDevice.fromSize(
          size: s21UltraLandscape,
          device: Device.phone,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('samsung s21 landscape', () {
      expect(
        SupaDevice.fromSize(
          size: s21Landscape,
          device: Device.phone,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('pixel 4a landscape', () {
      expect(
        SupaDevice.fromSize(
          size: pixel4aLandscape,
          device: Device.phone,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.medium,
      );
    });
    test('ipad pro 11 landscape', () {
      expect(
        SupaDevice.fromSize(
          size: ipadPro11Landscape,
          device: Device.tablet,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.large,
      );
    });
    test('ipad pro 12 landscape', () {
      expect(
        SupaDevice.fromSize(
          size: ipadPro12Landscape,
          device: Device.tablet,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
    test('samsung tab s7 landscape', () {
      expect(
        SupaDevice.fromSize(
          size: samsungTabS7Landscape,
          device: Device.tablet,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.large,
      );
    });
    test('samsung tab s6 landscape', () {
      expect(
        SupaDevice.fromSize(
          size: samsungTabS6Landscape,
          device: Device.tablet,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.large,
      );
    });
    test('samsung tab s5 landscape', () {
      expect(
        SupaDevice.fromSize(
          size: samsungTabS5Landscape,
          device: Device.tablet,
          orientation: DeviceOrientation.landscapeLeft,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.extraLarge,
      );
    });
  });

  group('from size watch', () {
    test('appleWatch', () {
      expect(
        SupaDevice.fromSize(
          size: appleWatch,
          device: Device.watch,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.ios,
        ).screenType,
        ScreenSize.watch,
      );
    });
    test('other watch', () {
      expect(
        SupaDevice.fromSize(
          size: otherWatch,
          device: Device.watch,
          orientation: DeviceOrientation.portraitUp,
          deviceOS: OS.android,
        ).screenType,
        ScreenSize.watch,
      );
    });
  });
}

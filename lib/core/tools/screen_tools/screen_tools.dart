import 'package:flutter/material.dart';

import '../extensions/export.dart';

/// Diferent sizes for the app
enum ScreenSize {
  /// Watch screen size
  w(Offset(0, 300)),

  /// Extra small
  xs(Offset(300, 360)),

  /// Small
  s(Offset(361, 599)),

  /// Medium
  m(Offset(600, 1024)),

  /// Large
  l(Offset(1025, 1200)),

  /// Extra large
  xl(Offset(1201, double.infinity));

  const ScreenSize(this.offset);

  /// Offset for the screen size
  final Offset offset;

  static ScreenSize whatsSize(double width) {
    assert(
        width > 0, 'Width must be positive, also has to be real screen size');

    for (var element in ScreenSize.values) {
      if (element.offset.isInRange(width)) return element;
    }

    throw Exception('No screen size found for width: $width');
  }
}

enum SupaDevice {
  /// Dimensions for watch
  watch(Size(300, 300)),

  /// Dimensions for the phone on portrait mode
  phonePortrait(Size(599, 900)),

  /// Dimensions for the phone on landscape mode
  phoneLandscape(Size(900, 599)),

  /// Dimensions for the tablet on portrait mode
  tabletPortrait(Size(1280, 1366)),

  /// Dimensions for the tablet on landscape mode
  tabletLandscape(Size(1366, 1280)),

  /// Dimensions for the desktop
  desktop(Size(double.infinity, double.infinity));

  final Size maxSize;

  const SupaDevice(this.maxSize);
  static SupaDevice getDevice(Size size) {
    if (size.smallerThan(SupaDevice.watch.maxSize)) return SupaDevice.watch;
    if (size.smallerThan(SupaDevice.phonePortrait.maxSize)) {
      return SupaDevice.phonePortrait;
    }
    if (size.smallerThan(SupaDevice.phoneLandscape.maxSize)) {
      return SupaDevice.phoneLandscape;
    }
    if (size.smallerThan(SupaDevice.tabletPortrait.maxSize)) {
      return SupaDevice.tabletPortrait;
    }
    if (size.smallerThan(SupaDevice.tabletLandscape.maxSize)) {
      return SupaDevice.tabletLandscape;
    }
    return SupaDevice.desktop;
  }

  bool get isPhone =>
      this == SupaDevice.phonePortrait || this == SupaDevice.phoneLandscape;
  bool get isTablet =>
      this == SupaDevice.tabletPortrait || this == SupaDevice.tabletLandscape;
}

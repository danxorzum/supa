import 'dart:ui';

extension OfftedExtension on Offset {
  /// Returns true if the value between [dx] and [dy].
  bool inRange(double value) => value >= dx && value <= dy ? true : false;
}

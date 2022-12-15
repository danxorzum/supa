part of 'export.dart';

extension OfftedExtension on Offset {
  /// Returns true if the value between [dx] and [dy].
  bool isInRange(double value) => value >= dx && value <= dy ? true : false;
}

extension SizeExtension on Size {
  /// Returns true if  [value] is under [width] and [height] or equal.
  bool smallerThan(Size value) =>
      width <= value.width && height <= value.height ? true : false;

  /// Returns true if  [value] is over [width] and [height].
  bool biggerThan(Size value) =>
      width >= value.width && height >= value.height ? true : false;
}

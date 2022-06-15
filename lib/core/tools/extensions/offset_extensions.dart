part of 'export.dart';

extension OfftedExtension on Offset {
  /// Returns true if the value between [dx] and [dy].
  bool isInRange(double value) => value >= dx && value <= dy ? true : false;
}

extension SizeExtension on Size {
  /// Returns true if  [value] is under [width] and [height].
  bool smallerThan(Size value) =>
      value.width < width && value.height < height ? true : false;

  /// Returns true if  [value] is over [width] and [height].
  bool biggerThan(Size value) =>
      value.width >= width && value.height >= height ? true : false;
}

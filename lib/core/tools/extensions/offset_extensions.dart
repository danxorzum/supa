part of 'export.dart';

extension OfftedExtension on Offset {
  /// Returns true if the value between [dx] and [dy].
  bool isInRange(double value) => value >= dx && value <= dy ? true : false;
}

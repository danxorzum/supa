part of 'export.dart';

extension SupaConstraints on BoxConstraints {
  bool get isXs => ScreenSize.xs.offset.isInRange(maxWidth);
  bool get isS => ScreenSize.s.offset.isInRange(maxWidth);
  bool get isM => ScreenSize.m.offset.isInRange(maxWidth);
  bool get isL => ScreenSize.l.offset.isInRange(maxWidth);
  bool get isXl => ScreenSize.xl.offset.isInRange(maxWidth);

  bool get biggerThanXs => maxWidth > ScreenSize.xs.offset.dx;
  bool get biggerThanS => maxWidth > ScreenSize.s.offset.dx;
  bool get biggerThanM => maxWidth > ScreenSize.m.offset.dx;
  bool get biggerThanL => maxWidth > ScreenSize.l.offset.dx;
  bool get biggerThanXl => maxWidth > ScreenSize.xl.offset.dx;

  bool get smallerThanXs => maxWidth < ScreenSize.xs.offset.dx;
  bool get smallerThanS => maxWidth < ScreenSize.s.offset.dx;
  bool get smallerThanM => maxWidth < ScreenSize.m.offset.dx;
  bool get smallerThanL => maxWidth < ScreenSize.l.offset.dx;
  bool get smallerThanXl => maxWidth < ScreenSize.xl.offset.dx;
}

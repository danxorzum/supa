part of 'helpers.dart';

class SupaHelp {
  SupaHelp(this.width);

  final double width;

//EdgeInsets
  EdgeInsets get getHorizontalIns => SupaInsets.horizontal(width);
  EdgeInsets get getVerticalIns => SupaInsets.vertical(width);
  EdgeInsets get getAllIns => SupaInsets.all(width);
  EdgeInsets only(
          {bool top = false,
          bool bottom = false,
          bool left = true,
          bool rigth = false}) =>
      SupaInsets.only(width,
          top: top, bottom: bottom, left: left, rigth: rigth);

//Sized box "Volumen"
  //column
  SizedBox get columnSpaceLarge =>
      SizedBox(height: SupaInsets.getInsetValue(width * 1.5));
  SizedBox get columnSpace => SizedBox(height: SupaInsets.getInsetValue(width));
  SizedBox get columnSpaceSmall =>
      SizedBox(height: SupaInsets.getInsetValue(width * 0.5));
  //row
  SizedBox get rowSpaceLarge =>
      SizedBox(width: SupaInsets.getInsetValue(width * 1.5));
  SizedBox get rowSpace => SizedBox(width: SupaInsets.getInsetValue(width));
  SizedBox get rowSpaceSmall =>
      SizedBox(width: SupaInsets.getInsetValue(width * 0.5));
  SizedBox get squareBox => SizedBox(
      width: SupaInsets.getInsetValue(width),
      height: SupaInsets.getInsetValue(width));

//Corners
  double get getCorner => SupaCorners.getCorner(width);
  BorderRadius get getBorderCircular => SupaCorners.getCornerBorder(width);
  Radius get getRadius => SupaCorners.getCornerRadius(width);
}

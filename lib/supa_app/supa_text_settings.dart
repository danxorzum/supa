class SupaTextSettings {
  ///Default Settings for your respinsive design.
  SupaTextSettings({
    required this.textThemeScales,
  });

  ///Scales for your app.
  final TextThemeScales textThemeScales;
}

class TextThemeScales {
  ///Default Settings for your respinsive scale.
  TextThemeScales(
      {this.xsScale = 0.95,
      this.xsBigScale = 0.75,
      this.mScale = 1.05,
      this.lScale = 1.15,
      this.xlScale = 1.2});

  ///Scale for extra small devices.
  ///By default is 0.95
  final double xsScale;

  ///Second scale for extra small devices.
  ///By default is 0.75
  final double xsBigScale;

  ///Scale for medium devices.
  ///By default is 1.05
  final double mScale;

  ///Scale for large devices.
  ///By default is 1.15
  final double lScale;

  ///Scale for extra large devices.
  ///By default is 1.2
  final double xlScale;
}

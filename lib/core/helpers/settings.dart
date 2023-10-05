class SupaSettings {
  /// Default settings for the app
  SupaSettings(
      {this.wIns = 5,
      this.xsIns = 10,
      this.smIns = 20,
      this.medIns = 25,
      this.lgIns = 30,
      this.xlIns = 32,
      this.smCor = 3,
      this.medCor = 5,
      this.lgCor = 10});

  /// watch size insets
  final double wIns;

  /// extra small size insets
  final double xsIns;

  /// small size insets
  final double smIns;

  /// medium size insets
  final double medIns;

  /// large size insets
  final double lgIns;

  /// extra large size insets
  final double xlIns;

  /// small corner radius
  final double smCor;

  /// medium corner radius
  final double medCor;

  /// large corner radius
  final double lgCor;
}

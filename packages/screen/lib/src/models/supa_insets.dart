///{@template supa_insets}
/// A class that holds the Insets for each device type.
/// {@endtemplate}
class SupaInsets {
  ///{@macro supa_insets}
  const SupaInsets({
    required this.watchHorizontal,
    required this.watchVertical,
    required this.extraSmallHorizontal,
    required this.extraSmallVertical,
    required this.smallHorizontal,
    required this.smallVertical,
    required this.mediumHorizontal,
    required this.mediumVertical,
    required this.largeHorizontal,
    required this.largeVertical,
    required this.extraLargeHorizontal,
    required this.extraLargeVertical,
  });

  ///Watch horizontal insets
  final double watchHorizontal;

  ///Watch vertical insets
  final double watchVertical;

  ///Extra small horizontal insets
  final double extraSmallHorizontal;

  ///Extra small vertical insets
  final double extraSmallVertical;

  ///Small horizontal insets
  final double smallHorizontal;

  ///Small vertical insets
  final double smallVertical;

  ///Medium horizontal insets
  final double mediumHorizontal;

  ///Medium vertical insets
  final double mediumVertical;

  ///Large horizontal insets
  final double largeHorizontal;

  ///Large vertical insets
  final double largeVertical;

  ///Extra large horizontal insets
  final double extraLargeHorizontal;

  ///Extra large vertical insets
  final double extraLargeVertical;
}

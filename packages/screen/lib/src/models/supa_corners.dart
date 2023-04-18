///{@template supa_corners}
/// A class that holds the corner radius for each device type.
/// {@endtemplate}
class SupaCorners {
  ///{@macro supa_corners}
  const SupaCorners({
    required this.watch,
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  ///Watch corner radius
  final double watch;

  ///Extra small corner radius
  final double extraSmall;

  ///Small corner radius
  final double small;

  ///Medium corner radius
  final double medium;

  ///Large corner radius
  final double large;

  ///Extra large corner radius
  final double extraLarge;
}

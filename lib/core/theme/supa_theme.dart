part of 'theme.dart';

class SupaTheme extends InheritedWidget {
  const SupaTheme(
      {required this.supaThemeData, super.key, required super.child});

  final SupaThemeData supaThemeData;

  @override
  bool updateShouldNotify(SupaTheme oldWidget) => false;
}

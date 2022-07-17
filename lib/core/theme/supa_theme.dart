part of 'theme.dart';

//TODO adapt to be like ThemeData.
class SupaTheme extends InheritedTheme {
  const SupaTheme({required this.data, super.key, required super.child});

  final SupaThemeData data;

  @override
  bool updateShouldNotify(SupaTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SupaTheme(data: data, child: child);
  }
}

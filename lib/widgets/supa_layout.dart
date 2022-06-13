part of 'supa_widgets.dart';

class SupaLayout extends StatelessWidget {
  const SupaLayout(
      {required this.child,
      super.key,
      this.appBar,
      this.background,
      this.drawer,
      this.navigationRail,
      this.bottomNavigationBar});

  final AppBar? appBar;
  final Widget? background;
  final Widget child;
  final Drawer? drawer;
  final NavigationRail? navigationRail;
  final BottomNavigationBar? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: navigationRail ?? bottomNavigationBar,
        drawer: drawer,
        body: Stack(
          children: [
            background ?? const SizedBox(),
            child,
          ],
        ));
  }
}

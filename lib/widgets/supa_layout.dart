part of 'widgets.dart';

class SupaLayout extends StatelessWidget {
  const SupaLayout(
      {required this.child,
      super.key,
      this.appBar,
      this.background,
      this.drawer,
      this.navigationRail,
      this.bottomNavigationBar,
      this.floatingActionButton});

  final AppBar? appBar;
  final Widget? background;
  final Widget child;
  final Drawer? drawer;
  final NavigationRail? navigationRail;
  final BottomNavigationBar? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: AppController.instance.scaffoldKey,
        appBar: appBar,
        bottomNavigationBar: navigationRail ?? bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        drawer: drawer,
        body: Stack(
          children: [
            background ?? const SizedBox(),
            child,
          ],
        ));
  }
}

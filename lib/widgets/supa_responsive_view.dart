part of 'supa_widgets.dart';

class SupaResponsiveView extends StatelessWidget {
  const SupaResponsiveView(
      {Key? key,
      required this.child,
      this.landscapeMobile,
      this.portraitTablet,
      this.desktop})
      : super(key: key);

  final Widget child;
  final Widget? landscapeMobile;
  final Widget? portraitTablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final screenDevice = AppController.help.screenDevice;
    switch (screenDevice) {
      case SupaDevice.watch:
      case SupaDevice.phonePortrait:
        return child;
      case SupaDevice.phoneLandscape:
        return landscapeMobile ?? child;
      case SupaDevice.tabletPortrait:
        return portraitTablet ?? child;
      case SupaDevice.tabletLandscape:
      case SupaDevice.desktop:
        return desktop ?? portraitTablet ?? landscapeMobile ?? child;
    }
  }
}

part of 'supa_widgets.dart';

class SupaView extends StatelessWidget {
  const SupaView({
    this.watch,
    this.landscapeMobile,
    required this.portraitMobile,
    this.landscapeTablet,
    this.portraitTablet,
    this.landscapeDesktop,
    this.portraitDesktop,
    this.canLanscapeLeft = false,
    this.canPortraitDown = false,
    super.key,
  });

  final Widget? watch;
  final Widget? landscapeMobile;
  final Widget portraitMobile;
  final Widget? landscapeTablet;
  final Widget? portraitTablet;
  final Widget? landscapeDesktop;
  final Widget? portraitDesktop;

  final bool canPortraitDown;
  final bool canLanscapeLeft;

  @override
  Widget build(BuildContext context) {
    final device = context.help.device;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      if (canPortraitDown) DeviceOrientation.portraitDown,
      if (device != SupaDevice.watch ||
          (device.isPhone && landscapeMobile != null) ||
          (device.isTablet && landscapeTablet != null) ||
          device == SupaDevice.desktop)
        DeviceOrientation.landscapeRight,
      if (canLanscapeLeft && device != SupaDevice.watch ||
          (device.isPhone && landscapeMobile != null) ||
          (device.isTablet && landscapeTablet != null) ||
          device == SupaDevice.desktop)
        DeviceOrientation.landscapeLeft,
    ]);
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.landscape) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.smallerThanW) return watch ?? portraitMobile;
            if (constraints.smallerThanS) {
              return landscapeMobile ?? portraitMobile;
            }
            if (constraints.smallerThanM) {
              return landscapeTablet ?? portraitTablet ?? portraitMobile;
            }
            return landscapeDesktop ?? portraitDesktop ?? portraitMobile;
          },
        );
      }
      return LayoutBuilder(builder: (context, constraints) {
        if (constraints.smallerThanW) return watch ?? portraitMobile;
        if (constraints.smallerThanS) return portraitMobile;
        if (constraints.smallerThanM) return portraitTablet ?? portraitMobile;
        return portraitDesktop ?? landscapeDesktop ?? portraitMobile;
      });
    }));
  }
}

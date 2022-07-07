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
    // this.canLanscapeLeft = false,
    // this.canPortraitDown = false,
    super.key,
  });

  final Widget? watch;
  final Widget? landscapeMobile;
  final Widget portraitMobile;
  final Widget? landscapeTablet;
  final Widget? portraitTablet;
  final Widget? landscapeDesktop;
  final Widget? portraitDesktop;

  // final bool canPortraitDown;
  // final bool canLanscapeLeft;

  @override
  Widget build(BuildContext context) {
    final device = context.help.device;

//TODO: add  OP validation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // if (canPortraitDown) DeviceOrientation.portraitDown,
      if (device != SupaDevice.watch &&
              (device.isPhone && landscapeMobile != null) ||
          (device.isTablet && landscapeTablet != null) ||
          device == SupaDevice.desktop) ...[
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]
    ]);
    switch (device) {
      case SupaDevice.watch:
        return watch ?? portraitMobile;
      case SupaDevice.phonePortrait:
        return portraitMobile;
      case SupaDevice.phoneLandscape:
        return landscapeMobile ?? portraitMobile;
      case SupaDevice.tabletPortrait:
        return portraitTablet ?? portraitMobile;
      case SupaDevice.tabletLandscape:
        return landscapeTablet ?? portraitTablet ?? portraitMobile;
      case SupaDevice.desktop:
        return landscapeDesktop ??
            portraitDesktop ??
            landscapeTablet ??
            portraitMobile;
    }
  }
}

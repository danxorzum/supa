part of 'supa_widgets.dart';

class SupaView extends StatefulWidget {
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

  @override
  State<SupaView> createState() => _SupaViewState();
}

class _SupaViewState extends State<SupaView> {
  // final bool canPortraitDown;

  @override
  void initState() {
    super.initState();
    AppController.instance.addListener(() =>
        AppController.instance.state == AppLifecycleState.resumed
            ? setState(() {})
            : null);
  }

  @override
  void dispose() {
    AppController.instance.removeListener(() =>
        AppController.instance.state == AppLifecycleState.resumed
            ? setState(() {})
            : null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final device = context.help.device;

//TODO: add  OP validation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // if (canPortraitDown) DeviceOrientation.portraitDown,
      if (device != SupaDevice.watch &&
              (device.isPhone && widget.landscapeMobile != null) ||
          (device.isTablet && widget.landscapeTablet != null) ||
          device == SupaDevice.desktop) ...[
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]
    ]);
    switch (device) {
      case SupaDevice.watch:
        return widget.watch ?? widget.portraitMobile;
      case SupaDevice.phonePortrait:
        return widget.portraitMobile;
      case SupaDevice.phoneLandscape:
        return widget.landscapeMobile ?? widget.portraitMobile;
      case SupaDevice.tabletPortrait:
        return widget.portraitTablet ?? widget.portraitMobile;
      case SupaDevice.tabletLandscape:
        return widget.landscapeTablet ??
            widget.portraitTablet ??
            widget.portraitMobile;
      case SupaDevice.desktop:
        return widget.landscapeDesktop ??
            widget.portraitDesktop ??
            widget.landscapeTablet ??
            widget.portraitMobile;
    }
  }
}

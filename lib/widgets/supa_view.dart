part of 'supa_widgets.dart';

class SupaView extends StatefulWidget {
  const SupaView({
    this.watch,
    this.landscapeMobile,
    this.portraitMobile,
    this.landscapeTablet,
    this.portraitTablet,
    this.desktop,
    this.responsiveDesktop,
    this.canPortraitDown = false,
    this.mergeToDesktop = false,
    super.key,
  })  : assert(
            (landscapeMobile != null || portraitMobile != null) ||
                (landscapeTablet != null || portraitTablet != null) ||
                (desktop != null || responsiveDesktop != null),
            'You must provide at least one widget for mobile, tablet or desktop'),
        assert(!(desktop != null && responsiveDesktop != null),
            'You must provide only one desktop');

  final Widget? watch;
  final Widget? landscapeMobile;
  final Widget? portraitMobile;
  final Widget? landscapeTablet;
  final Widget? portraitTablet;
  final Widget? desktop;
  final SupaResponsiveView? responsiveDesktop;

  final bool canPortraitDown;
  final bool mergeToDesktop;

  @override
  State<SupaView> createState() => _SupaSingleViewState();
}

class _SupaSingleViewState extends State<SupaView> {
  final _previusOrientation = AppController.instance.currentOrientation;
  void _listen() {
    AppController.instance.state == AppLifecycleState.resumed
        ? setState(() {})
        : null;
  }

  @override
  void initState() {
    super.initState();
    AppController.instance.addListener(_listen);
    final device = AppController.help.device;
    final controller = AppController.instance;
    //call future inside initState

    WidgetsBinding.instance.addPostFrameCallback((_) async =>
        await Future.delayed(SupaDuration.halfSecond, () {
          if (device != SupaDevice.desktop) {
            final ori = SupaOrientation(
              portraitUp: ((device.isPhone && widget.portraitMobile != null) ||
                  (device.isTablet && widget.portraitTablet != null)),
              portraitDown:
                  ((device.isPhone && widget.portraitMobile != null) ||
                          (device.isTablet && widget.portraitTablet != null)) &&
                      widget.canPortraitDown,
              landscape: ((device.isPhone && widget.landscapeMobile != null) ||
                  (device.isTablet && widget.landscapeTablet != null)),
            );
            SystemChrome.setPreferredOrientations(ori.orientations);
            controller.setNewOrientation(orientation: ori);
          }
        }));
  }

  @override
  void dispose() {
    AppController.instance.removeListener(_listen);
    if (AppController.help.device != SupaDevice.desktop) {
      SystemChrome.setPreferredOrientations(_previusOrientation.orientations);
      AppController.instance
          .setNewOrientation(orientation: _previusOrientation);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final help = context.help;
    final device = help.device;

    assert(
      AppController.instance.areControllerInitialized,
      'You must use SupaAppExtension as a parent of SupaView or you must instantiate AppController and initialize it',
    );
    switch (device) {
      case SupaDevice.watch:
        return widget.watch ?? const _ErrorWidget(name: 'Watch');

      case SupaDevice.phonePortrait:
        return widget.portraitMobile ??
            widget.landscapeMobile ??
            const _ErrorWidget(name: 'Phone Portrait');
      case SupaDevice.phoneLandscape:
        return widget.landscapeMobile ??
            widget.portraitMobile ??
            const _ErrorWidget(name: 'Phone Landscape');
      case SupaDevice.tabletPortrait:
        return widget.portraitTablet ??
            widget.landscapeTablet ??
            const _ErrorWidget(name: 'Tablet Portrait');
      case SupaDevice.tabletLandscape:
        return widget.landscapeTablet ??
            widget.portraitTablet ??
            const _ErrorWidget(name: 'Tablet Landscape');
      case SupaDevice.desktop:
        {
          if (widget.responsiveDesktop != null) {
            return widget.responsiveDesktop!;
          } else if (widget.mergeToDesktop) {
            assert(widget.portraitMobile != null,
                'You must provide a portraitMobile widget');
            return SupaResponsiveView(
              landscapeMobile: widget.landscapeMobile,
              portraitTablet: widget.portraitTablet,
              desktop: widget.desktop,
              child: widget.portraitMobile!,
            );
          }
          return widget.desktop ?? const _ErrorWidget(name: 'Desktop');
        }
    }
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = context.help.size;
    log('',
        name: 'SupaView', error: "You must provide a widget for $name view");
    return SizedBox(
      height: double.infinity,
      width: size.width,
      child: Center(
        child: Text(
          'Error you are trying to use $name but you have not set it',
          style: TextStyle(
            color: context.colorS.error,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

part of 'supa_widgets.dart';

class SupaSingleView extends StatefulWidget {
  const SupaSingleView({
    this.portrait,
    this.landscape,
    this.canPortraitDown = false,
    super.key,
  }) : assert((landscape != null || portrait != null),
            'You must provide at least one widget for mobile, tablet or desktop');

  final Widget? portrait;
  final Widget? landscape;

  final bool canPortraitDown;

  @override
  State<SupaSingleView> createState() => _SupaViewState();
}

class _SupaViewState extends State<SupaSingleView> {
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

    final controller = AppController.instance;

    final ori = SupaOrientation(
      portraitUp: widget.portrait != null,
      portraitDown: widget.portrait != null && widget.canPortraitDown,
      landscape: widget.landscape != null,
    );
    SystemChrome.setPreferredOrientations(ori.orientations);
    controller.setNewOrientation(orientation: ori);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(_previusOrientation.orientations);
    AppController.instance.setNewOrientation(orientation: _previusOrientation);
    AppController.instance.removeListener(_listen);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(
      AppController.instance.areControllerInitialized,
      'You must use SupaAppExtension as a parent of SupaSingleView or you must instantiate AppController and initialize it',
    );
    return OrientationBuilder(builder: (_, orientation) {
      if (orientation == Orientation.portrait) {
        return widget.portrait ?? widget.landscape!;
      }
      return widget.landscape ?? widget.portrait!;
    });
  }
}

import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';
import 'supa_child.dart';
import 'app_controller.dart';
import 'supa_settings.dart';

class SupaApp extends StatefulWidget {
  ///Do not use inside MaterialApp.
  ///use Directly in [runApp] envolving you app.
  SupaApp({
    required this.child,
    required this.controller,
    this.notifyIfLifeCycleChanged = true,
    SupaSettings? supaSettings,
    Key? key,
  }) : super(key: key) {
    ss = supaSettings ?? SupaSettings.fast();
  }

  final Widget child;
  final AppController controller;
  final bool notifyIfLifeCycleChanged;
  late final SupaSettings ss;

  @override
  State<SupaApp> createState() => _SupaAppState();
}

class _SupaAppState extends State<SupaApp> with WidgetsBindingObserver {
  Size _size = WidgetsBinding.instance!.window.physicalSize;
  final _ratio = WidgetsBinding.instance!.window.devicePixelRatio;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    widget.controller.setFont(widget.ss);
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _size = WidgetsBinding.instance!.window.physicalSize;
    _updateSize();
  }

  @override
  void didChangeTextScaleFactor() {
    widget.controller.onTextScaleChanged(widget.ss);
    super.didChangeTextScaleFactor();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.controller
        .updateLifecycleState(state, widget.notifyIfLifeCycleChanged);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    widget.controller.removeListener(() => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SupaChild(
      controller: widget.controller,
      child: widget.child,
      // child: AnimatedBuilder(
      //     animation: widget.controller,
      //     builder: (context, __) {
      //       print('redraw from library');
      //       return widget.child;
      //     }),
    );
  }

  _updateSize() {
    if (widget.controller.ss != ssFromWidth(_size.width * _ratio)) {
      widget.controller.verifySizes(widget.ss);
    }
  }
}

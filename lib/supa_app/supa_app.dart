import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';
import 'supa_child.dart';
import 'app_controller.dart';

class SupaApp extends StatefulWidget {
  ///Do not use inside MaterialApp.
  ///
  ///[SupaApp] is the main widget of your app.
  ///it cares about your [AppController] and [SupaChild].
  ///it also listen a helpus events like device [physicalSize], [AppLifeCycle] and [textScaleFactor].
  ///it redraws your app when sizes changes.
  ///Use envolving [MaterialApp].
  const SupaApp({
    required this.builder,
    required this.controller,
    this.notifyIfLifeCycleChanged = true,
    super.key,
  });

  ///builder for your [MaterialApp].
  final Widget Function(BuildContext context) builder;

  /// Your [AppController].
  final AppController controller;

  ///Set false to disable [AppLifeCycle] auto events.
  ///if[notifyIfLifeCycleChanged] is true, it will notify [AppController] when [AppLifeCycle] changes.
  ///
  ///By default it is true.
  final bool notifyIfLifeCycleChanged;

  @override
  State<SupaApp> createState() => _SupaAppState();
}

class _SupaAppState extends State<SupaApp> with WidgetsBindingObserver {
  Size _size = WidgetsBinding.instance.window.physicalSize;
  final _ratio = WidgetsBinding.instance.window.devicePixelRatio;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _size = WidgetsBinding.instance.window.physicalSize;
    _updateSize();
  }

  @override
  void didChangeTextScaleFactor() {
    widget.controller.onTextScaleChanged();
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
    WidgetsBinding.instance.removeObserver(this);
    widget.controller.removeListener(() => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SupaChild(
      controller: widget.controller,
      child: AnimatedBuilder(
          animation: widget.controller, builder: (_, __) => widget.builder(_)),
    );
  }

  _updateSize() {
    if (widget.controller.ss != ScreenSize.whatsSize(_size.width * _ratio)) {
      widget.controller.verifySizes();
    }
  }
}

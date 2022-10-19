import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:supa/core/core.dart';

class SupaAppExtension extends StatefulWidget {
  ///Do not use inside MaterialApp.
  ///
  ///[SupaAppExtension] is the main widget of your app.
  ///it cares about your [AppController] and [SupaChild].
  ///it also listen a helpus events like device [physicalSize], [AppLifeCycle] and [textScaleFactor].
  ///it redraws your app when sizes changes.
  ///Use envolving [MaterialApp].
  const SupaAppExtension({
    this.themeData,
    this.datkThemeData,
    this.textThemeScales,
    required this.builder,
    this.cupertinoDarkTheme,
    this.cupertinoThemeData,
    this.materialDarkTheme,
    this.materialTheme,
    this.notifyIfLifeCycleChanged = true,
    this.notifyIfScreenSizeChanged = true,
    super.key,
  });

  ///builder for your [MaterialApp].
  final Widget Function(BuildContext context, ThemeData materialTheme,
      CupertinoThemeData cupertinoThemeData) builder;

  ///Set false to disable [AppLifeCycle] auto events.
  ///if[notifyIfLifeCycleChanged] is true, it will notify [AppController] when [AppLifeCycle] changes.
  ///
  ///By default it is true.
  final bool notifyIfLifeCycleChanged;
  final bool notifyIfScreenSizeChanged;

  final SupaThemeData? themeData;
  final SupaThemeData? datkThemeData;
  final TextThemeScales? textThemeScales;

  final ThemeData? materialTheme;
  final ThemeData? materialDarkTheme;
  final CupertinoThemeData? cupertinoThemeData;
  final CupertinoThemeData? cupertinoDarkTheme;

  @override
  State<SupaAppExtension> createState() => _SupaAppExtensionState();
}

class _SupaAppExtensionState extends State<SupaAppExtension>
    with WidgetsBindingObserver {
  Size _size = WidgetsBinding.instance.window.physicalSize;
  final _ratio = WidgetsBinding.instance.window.devicePixelRatio;

  final _appController = AppController.instance;

  late SupaThemeData _themeData;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
    _appController.init(SupaOrientation(
      portraitUp: true,
      portraitDown: true,
      landscape: true,
    ));
    _themeData = widget.themeData ??
        (widget.materialTheme != null
            ? SupaThemeData.fromMaterial(widget.materialTheme!)
            : SupaThemeData.light());
    if (widget.notifyIfScreenSizeChanged) {
      _themeData = _themeData.resize(_appController.supaHelp.screenSize);
    }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _size = WidgetsBinding.instance.window.physicalSize;
    _updateSize();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appController.updateLifecycleState(state, widget.notifyIfLifeCycleChanged);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _appController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnimatedBuilder(
          animation: _appController,
          builder: (_, __) {
            return SupaTheme(
              data: _themeData,
              child: Builder(
                builder: (context) => widget.builder(
                    context,
                    context.sTheme.toMaterial(theme: widget.materialTheme),
                    context.sTheme.toCupertino()),
              ),
            );
          }),
    );
  }

  _updateSize() {
    if (_appController.supaHelp.screenSize !=
        ScreenSize.whatsSize(_size.width / _ratio)) {
      if (widget.notifyIfScreenSizeChanged) {
        _themeData = _themeData.resize(_appController.supaHelp.screenSize);
      }
      _appController.verifySizes(widget.notifyIfScreenSizeChanged);
    }
  }
}

import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';
import 'supa_text_settings.dart';

class AppController with ChangeNotifier {
  ///Created a controller for the app.
  ///
  ///The controller automatically manage rezing of the  font app.
  ///
  ///The controller defaults only work with material 3.
  AppController._(ScreenSize ss, double);

  final AppController _controller;

  factory AppController({
    SupaTextSettings? settings,
  }) {
    return _AppController(settings: settings);
  }

  late ScreenSize _ss;
  late double _textScale;
  final ValueNotifier<AppLifecycleState> _state =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.resumed);
  final ValueNotifier<AppLifecycleState> _lastsState =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.inactive);

  //getters

  ///The current [ScreenSize] of the app.
  ScreenSize get ss => _ss;

  ///Get the current [AppLifecycleState] of the app.
  AppLifecycleState get state => _state.value;

  ///Get the last [AppLifecycleState] of the app.
  AppLifecycleState get lastState => _lastsState.value;

  ///Get the current [AppLifecycleState] in a value notifier.
  ///you can use it to listen to the state of the app.
  ValueNotifier<AppLifecycleState> get stateNotifier => _state;

  ///Get the last [AppLifecycleState] in a value notifier.
  ///you can use it to listen to the state of the app.
  ValueNotifier<AppLifecycleState> get lastStateNotifier => _lastsState;

  Size get physicalSize =>
      WidgetsFlutterBinding.ensureInitialized().window.physicalSize;

  ///Ff you are using [SupaApp] you don't need to call this method.
  ///[SupaApp] will listen for you.
  ///
  ///Call it when the [textScaleFactor] of the app change.
  void onTextScaleChanged() {
    _textScale = WidgetsBinding.instance.window.textScaleFactor;

    notifyListeners();
  }

  ///if you are using [SupaApp] you don't need to call this method.
  ///[SupaApp] will listen for you.
  ///
  ///Do not call it out runApp.
  ///Call it when device dimensions changes.
  void verifySizes() {
    final width = WidgetsBinding.instance.window.physicalSize.width;
    final pRatio = WidgetsBinding.instance.window.devicePixelRatio;
    final newSs = ScreenSize.whatsSize(width / pRatio);

    notifyListeners();
  }

  ///If you are using [SupaApp] you don't need to call this method.
  ///[SupaApp] will listend [AppLifecycleState] changes.
  ///By default [SupaApp] set[canNotifyListeners] to true.
  ///
  ///Call it when the [AppLifecycleState] of the app change.
  ///you can decide if notifyListeners() or not whit [canNotifyListeners].
  void updateLifecycleState(AppLifecycleState state, bool canNotifyListeners) {
    _lastsState.value = _state.value;
    _state.value = state;
    if (canNotifyListeners) notifyListeners();
  }
}

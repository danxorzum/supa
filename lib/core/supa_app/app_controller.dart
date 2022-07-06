import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:supa/core/core.dart';

class AppController with ChangeNotifier {
  ///Created a controller for the app.
  ///
  ///The controller automatically manage rezing of the  font app.
  ///
  ///The controller defaults only work with material 3.
  AppController._() {
    final size = WidgetsFlutterBinding.ensureInitialized().window.physicalSize;
    final ratio =
        WidgetsFlutterBinding.ensureInitialized().window.devicePixelRatio;
    log(Size(size.width * ratio, size.height / ratio).toString());
    _supaHelp = SupaHelp(Size(size.width / ratio, size.height / ratio));
  }

  //Instance of the controller.
  static final AppController _controller = AppController._();

  // factory AppController() => _controller;
  static AppController get instance => _controller;

  late SupaHelp _supaHelp;

  final ValueNotifier<AppLifecycleState> _state =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.resumed);
  final ValueNotifier<AppLifecycleState> _lastsState =
      ValueNotifier<AppLifecycleState>(AppLifecycleState.inactive);

  //getters
  SupaHelp get supaHelp => _supaHelp;

  static SupaHelp get help => _controller._supaHelp;

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

  ///if you are using [SupaApp] you don't need to call this method.
  ///[SupaApp] will listen for you.
  ///
  ///Do not call it out runApp.
  ///Call it when device dimensions changes.
  void verifySizes(bool canNotifyListeners) {
    final size = WidgetsBinding.instance.window.physicalSize;
    final pRatio = WidgetsBinding.instance.window.devicePixelRatio;
    _supaHelp = SupaHelp(size * pRatio);
    if (canNotifyListeners) notifyListeners();
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

  ///Updata all Listeners.
  ///
  ///If you are using [SupaApp] redraw the entire app.
  void updateListeners() {
    notifyListeners();
  }
}

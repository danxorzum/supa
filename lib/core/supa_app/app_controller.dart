import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  bool _areControllerInitialized = false;

  late SupaOrientation _currentOrientation;

  //getters
  SupaHelp get supaHelp => _supaHelp;

  ///Get the currents [SupaOrientation]of the app.
  SupaOrientation get currentOrientation => _currentOrientation;

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

  bool get areControllerInitialized => _areControllerInitialized;

  void init(SupaOrientation orientation) {
    _currentOrientation = orientation;
    _areControllerInitialized = true;
  }

  ///if you are using [SupaAppExtension] you don't need to call this method.
  ///[SupaAppExtension] will listen for you.
  ///
  ///Do not call it out runApp.
  ///Call it when device dimensions changes.
  void verifySizes(bool canNotifyListeners) {
    final size = WidgetsBinding.instance.window.physicalSize;
    final pRatio = WidgetsBinding.instance.window.devicePixelRatio;
    _supaHelp = SupaHelp(Size(size.width / pRatio, size.height / pRatio));
    if (canNotifyListeners) notifyListeners();
  }

  ///If you are using [SupaAppExtension] you don't need to call this method.
  ///[SupaAppExtension] will listend [AppLifecycleState] changes.
  ///By default [SupaAppExtension] set[canNotifyListeners] to true.
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
  ///If you are using [SupaAppExtension] redraw the entire app.
  void updateListeners() {
    notifyListeners();
  }

  ///Call it when the [DeviceOrientation] of the app change.
  ///SupaView will handle it for you.
  ///Do not use almost you are sure of what you are doing.
  void setNewOrientation({required SupaOrientation orientation}) {
    log('nueva orientacio: \n ${orientation.orientations}');
    if (_currentOrientation.compareOrientation(orientation)) return;
    _currentOrientation = orientation;
  }

  // void _updateOrientation() {
  //   final currentSO = _currentOrientation!.getOrientation(_supaHelp.device);
  //   log('cambiamos a: ${currentSO.orientations.toString()}');
  //   if (currentSO == null) return;
  //   SystemChrome.setPreferredOrientations(currentSO.orientations);
  // }
}

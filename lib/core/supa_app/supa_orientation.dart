import 'package:flutter/services.dart';

// class SupaOrientation {
//   final SOrientation watch;
//   final SOrientation mobile;
//   final SOrientation tablet;
//   final SOrientation desktop;

//   SupaOrientation(
//       {required this.watch,
//       required this.mobile,
//       required this.tablet,
//       required this.desktop});

//   factory SupaOrientation.defaultOrientation() => SupaOrientation(
//       watch: SOrientation(
//         portraitUp: true,
//         portraitDown: true,
//         landscapeLeft: false,
//         landscapeRight: false,
//       ),
//       mobile: SOrientation(
//           landscapeLeft: true,
//           landscapeRight: true,
//           portraitUp: true,
//           portraitDown: false),
//       tablet: SOrientation(
//           landscapeLeft: true,
//           landscapeRight: true,
//           portraitUp: true,
//           portraitDown: false),
//       desktop: SOrientation(
//           landscapeLeft: true,
//           landscapeRight: true,
//           portraitUp: false,
//           portraitDown: false));

//   SOrientation getOrientation(SupaDevice device) {
//     switch (device) {
//       case SupaDevice.watch:
//         return watch;
//       case SupaDevice.desktop:
//         return desktop;
//       case SupaDevice.phonePortrait:
//       case SupaDevice.phoneLandscape:
//         return mobile;
//       case SupaDevice.tabletPortrait:
//       case SupaDevice.tabletLandscape:
//         return tablet;
//     }
//   }

//   bool isSame(SupaOrientation other) =>
//       watch.compareOrientation(other.watch) &&
//       mobile.compareOrientation(other.mobile) &&
//       tablet.compareOrientation(other.tablet) &&
//       desktop.compareOrientation(other.desktop);
// }

class SupaOrientation {
  final bool portraitUp;
  final bool portraitDown;
  final bool landscape;

  SupaOrientation({
    required this.portraitUp,
    required this.portraitDown,
    required this.landscape,
  });

  SupaOrientation copyWith(
      {bool? portraitUp,
      bool? portraitDown,
      bool? landscapeLeft,
      bool? landscape}) {
    return SupaOrientation(
      portraitUp: portraitUp ?? this.portraitUp,
      portraitDown: portraitDown ?? this.portraitDown,
      landscape: landscapeLeft ?? this.landscape,
    );
  }

  List<DeviceOrientation> get orientations => [
        if (portraitUp) DeviceOrientation.portraitUp,
        if (portraitDown) DeviceOrientation.portraitDown,
        if (landscape) ...[
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ],
      ];

  bool compareOrientation(SupaOrientation orientation) {
    return portraitUp == orientation.portraitUp &&
        portraitDown == orientation.portraitDown &&
        landscape == orientation.landscape;
  }
}

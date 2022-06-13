part of 'supa_widgets.dart';

class SupaView extends StatelessWidget {
  SupaView({
    required this.layout,
    this.landscapeMobile,
    this.portraitMobile,
    this.landscapeTablet,
    this.portraitTablet,
    this.landscapeDesktop,
    this.portraitDesktop,
    super.key,
  }) {
    assert(
        landscapeMobile != null ||
            portraitMobile != null ||
            landscapeTablet != null ||
            portraitTablet != null ||
            landscapeDesktop != null ||
            portraitDesktop != null,
        'You must specify at least one screen size');
  }

  final Widget? landscapeMobile;
  final Widget? portraitMobile;
  final Widget? landscapeTablet;
  final Widget? portraitTablet;
  final Widget? landscapeDesktop;
  final Widget? portraitDesktop;
  final SupaLayout layout;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return LayoutBuilder(builder: (context, constraints) {
      if (orientation == Orientation.portrait) {
        if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
        } else {
          // return layout(chil);
        }
      }
    });
  }
}

part of 'widgets.dart';

class SupaWidget extends StatelessWidget {
  const SupaWidget(
      {super.key, required this.materialChild, required this.cupertinoChild});
  final Widget materialChild;
  final Widget cupertinoChild;

  @override
  Widget build(BuildContext context) => kIsWeb
      ? materialChild
      : Platform.isIOS || Platform.isMacOS
          ? cupertinoChild
          : materialChild;
}

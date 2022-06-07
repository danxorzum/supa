part of 'supa_widgets.dart';

class SupaDebouncingField extends StatefulWidget {
  const SupaDebouncingField(
      {required this.callback,
      this.decoration,
      this.duration,
      this.controller,
      super.key});

  final InputDecoration? decoration;
  final TextEditingController? controller;
  final Duration? duration;
  final void Function(String) callback;

  @override
  State<SupaDebouncingField> createState() => _SupaDebouncingFieldState();
}

class _SupaDebouncingFieldState extends State<SupaDebouncingField> {
  late final TextEditingController _controller;
  late final Duration _duration;
  Timer? _timer;

  String _lastValue = '';

  @override
  void initState() {
    super.initState();
    _duration = widget.duration ?? SupaDuration.halfSecond;
    _controller = widget.controller ?? TextEditingController();
  }

  void _callback() {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(widget.duration ?? SupaDuration.halfSecond, () {
      if (_controller.text != _lastValue) {
        _lastValue = _controller.text;
        widget.callback(_controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: widget.decoration ?? const InputDecoration(),
      onChanged: (_) => _callback(),
      controller: _controller,
      onSubmitted: widget.callback,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }
}

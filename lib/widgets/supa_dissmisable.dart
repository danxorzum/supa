part of 'supa_widgets.dart';

class SupaDissmisable extends StatefulWidget {
  const SupaDissmisable({
    super.key,
    required this.child,
    required this.background,
  });

  final Widget child;
  final Widget background;

  @override
  State<SupaDissmisable> createState() => _SupaDissmisableState();
}

class _SupaDissmisableState extends State<SupaDissmisable>
    with SingleTickerProviderStateMixin {
  double _xPosition = 0;
  double _lastXPosition = 0;
  double _xRelativePositionStart = 0;

  bool _isLeft = false;
  bool _hasAnimation = false;

  late AnimationController _controller;
  late Tween<double> _tween;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: SupaDuration.express);
    _tween = Tween<double>(begin: 0, end: 0);
    _controller.addStatusListener((status) => setState(() {
          _hasAnimation = status == AnimationStatus.forward ||
              status == AnimationStatus.reverse;
          if (status == AnimationStatus.completed) {
            _xPosition = _tween.end ?? 0;
          }
        }));
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colorS = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.1),
          child: Container(
            child: Container(
              height: double.infinity,
              color: colorS.error,
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.delete, color: colorS.onError),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(
              _hasAnimation ? _tween.evaluate(_controller) : _xPosition, 0),
          child: GestureDetector(
              onHorizontalDragStart: (details) {
                _lastXPosition = _xPosition;
                _xRelativePositionStart = details.localPosition.dx;
              },
              onHorizontalDragUpdate: onDrag,
              onHorizontalDragEnd: onDragEnd,
              child: LayoutBuilder(builder: (context, contraints) {
                return Container(color: colorS.background, child: widget.child);
              })),
        )
      ],
    );
  }

  void onDrag(DragUpdateDetails details) {
    if (details.localPosition.dx > _xRelativePositionStart) {
      _isLeft = false;
    } else {
      _isLeft = true;
    }
    final desplacement =
        (_xRelativePositionStart - details.localPosition.dx).abs();
    final x =
        _isLeft ? _lastXPosition - desplacement : _lastXPosition + desplacement;
    setState(() => _xPosition = x > 0 ? 0 : x);
  }

  void onDragEnd(DragEndDetails details) {
    if (_isLeft) {
      if (_xPosition < -100) {
        _tween = Tween<double>(begin: _xPosition, end: -100);
        _controller.reset();
        _controller.forward();
      } else {
        _tween = Tween<double>(begin: _xPosition, end: 0);
        _controller.reset();
        _controller.forward();
      }
    } else {
      if (_xPosition != 0) {
        _tween = Tween<double>(begin: _xPosition, end: 0);
        _controller.reset();
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

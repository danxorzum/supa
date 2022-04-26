part of 'supa_widgets.dart';

/// A [Form] that displays a [CodeField].
/// It uses InputDecorationTheme.
class SupaCodeForm extends StatefulWidget {
  const SupaCodeForm({Key? key, required this.onSubmit, this.constraints})
      : super(key: key);

  final Future<bool> Function(String code) onSubmit;

  ///The [constraints] are used to constrain the size of the text field.
  ///The [maxWidth] is used to constrain the width and height of the text field.
  final BoxConstraints? constraints;

  @override
  State<SupaCodeForm> createState() => _SupaCodeFormState();
}

class _SupaCodeFormState extends State<SupaCodeForm> {
  late final FocusNode _focusField1;
  late final FocusNode _focusField2;
  late final FocusNode _focusField3;
  late final FocusNode _focusField4;

  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  final _textController4 = TextEditingController();

  bool _enabled = true;
  bool _error = false;

  @override
  void initState() {
    _focusField1 = FocusNode();
    _focusField2 = FocusNode(
        onKey: (_, event) =>
            _onBackPressed(event, _focusField1, _textController2));
    _focusField3 = FocusNode(
        onKey: (_, event) =>
            _onBackPressed(event, _focusField2, _textController3));
    _focusField4 = FocusNode(
        onKey: (_, event) =>
            _onBackPressed(event, _focusField3, _textController4));

    super.initState();
    _focusField1.requestFocus();
  }

  KeyEventResult _onBackPressed(
      RawKeyEvent event, FocusNode back, TextEditingController controller) {
    if (event.logicalKey == LogicalKeyboardKey.backspace) {
      if (controller.text.isEmpty) {
        back.requestFocus();
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final textTheme = theme.textTheme;

    final constraints = widget.constraints ??
        BoxConstraints(
          maxWidth: size.width * 0.15,
        );
    return Form(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth,
              child: TextField(
                enabled: _enabled,
                controller: _textController1,
                textAlign: TextAlign.center,
                focusNode: _focusField1,
                onChanged: (value) {
                  if (value.length == 1) {
                    _focusField2.requestFocus();
                  }
                  if (value.length > 1) {
                    _textController1.text = value[value.length - 1];
                    _focusField2.requestFocus();
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  constraints: constraints,
                  enabledBorder: _error
                      ? inputTheme.errorBorder
                      : inputTheme.enabledBorder,
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth,
              child: TextField(
                enabled: _enabled,
                controller: _textController2,
                textAlign: TextAlign.center,
                focusNode: _focusField2,
                onChanged: (value) {
                  if (value.length == 1) _focusField3.requestFocus();

                  if (value.length > 1) {
                    _textController2.text = value[value.length - 1];
                    _focusField3.requestFocus();
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  constraints: constraints,
                  enabledBorder: _error
                      ? inputTheme.errorBorder
                      : inputTheme.enabledBorder,
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth,
              child: TextField(
                enabled: _enabled,
                controller: _textController3,
                textAlign: TextAlign.center,
                focusNode: _focusField3,
                onChanged: (value) {
                  if (value.length == 1) _focusField4.requestFocus();
                  if (value.length > 1) {
                    _textController3.text = value[value.length - 1];
                    _focusField4.requestFocus();
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  constraints: constraints,
                  enabledBorder: _error
                      ? inputTheme.errorBorder
                      : inputTheme.enabledBorder,
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth,
              child: TextField(
                enabled: _enabled,
                controller: _textController4,
                textAlign: TextAlign.center,
                focusNode: _focusField4,
                onChanged: (value) async {
                  if (value.length == 1) {
                    await _onSubmit();
                  }
                  if (value.length > 1) {
                    _textController4.text = value[value.length - 1];
                    _textController4.selection =
                        const TextSelection(baseOffset: 1, extentOffset: 1);
                    await _onSubmit();
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  constraints: constraints,
                  enabledBorder: _error
                      ? inputTheme.errorBorder
                      : inputTheme.enabledBorder,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        if (_error)
          Text(
            'Codigo de verificación incorrecto',
            style: textTheme.bodyText2?.copyWith(color: theme.errorColor),
          ),
      ],
    ));
  }

  Future<void> _onSubmit() async {
    _focusField4.unfocus();
    setState(() {
      _enabled = false;
    });
    _error = await widget.onSubmit(_textController1.text +
        _textController2.text +
        _textController3.text +
        _textController4.text);
    setState(() {
      _enabled = true;
      _focusField4.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusField1.dispose();
    _focusField2.dispose();
    _focusField3.dispose();
    _focusField4.dispose();
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    super.dispose();
  }
}

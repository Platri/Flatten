import 'package:flutter/material.dart';

class CodeEntryTextField extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  double fieldWidth;
  double fontSize;
  final String lastPin;

  CodeEntryTextField({
    this.lastPin,
    this.onSubmit,
    this.fieldWidth: 40.0,
    this.fontSize: 14.0,
  });
  @override
  _CodeEntryTextFieldState createState() => _CodeEntryTextFieldState();
}

class _CodeEntryTextFieldState extends State<CodeEntryTextField> {
  List<String> _pin;
  List<FocusNode> _focusNodes;
  List<TextEditingController> _textControllers;
  int _fields = 8;

  Widget textfields = Container();

  

  @override
  void initState() {
    super.initState();
    _pin = List<String>(_fields);
    _focusNodes = List<FocusNode>(_fields);
    _textControllers = List<TextEditingController>(_fields);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin.length; i++) {
            _pin[i] = widget.lastPin[i];
          }
        }
        textfields = generateTextFields(context);
      });
    });
  }

   @override
  void dispose() {
    _textControllers.forEach((TextEditingController t) => t.dispose());
    super.dispose();
  }

  //this clears the text fields after the last text has been entered
  void clearTextFields() {
    _textControllers.forEach(
        (TextEditingController tEditController) => tEditController.clear());
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i].text = widget.lastPin[i];
      }
    }

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    final String lastDigit = _textControllers[i].text;

    return Container(
      width: widget.fieldWidth,
      margin: EdgeInsets.symmetric(horizontal: 1),
      child: TextField(
        autofocus: autofocus,
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: widget.fontSize),
        focusNode: _focusNodes[i],
        obscureText: false,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0),
          ),
        ),
        
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != _fields) {
            _focusNodes[i].unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i].unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String str) {
         if (_pin.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ),
    );
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(_fields, (int i) {
      return buildTextField(i, context, i == 0);
    })
      ..insert(
          (_fields ~/ 2),
          Container(
            width: 10,
            height: 2,
            color: Colors.black54,
          ));

    FocusScope.of(context).requestFocus(_focusNodes[0]);

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}

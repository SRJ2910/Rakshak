import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rakshak/custom_widgets/constants.dart';

class TextFieldShadow extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String?)? onSave;
  final Function(String?)? validator;
  final String labelText;
  final IconData icon;
  final TextInputType textInputType;
  final bool obscureText;

  // ignore: use_key_in_widget_constructors
  const TextFieldShadow({
    this.onChanged,
    this.onSave,
    this.validator,
    required this.labelText,
    required this.icon,
    this.textInputType = TextInputType.none,
    this.obscureText = false,
  });

  @override
  State<TextFieldShadow> createState() => _TextFieldShadowState();
}

class _TextFieldShadowState extends State<TextFieldShadow> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, offset: Offset(2.0, 2.0))
              ]),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIconColor: kMarronColor,
                icon: Icon(
                  widget.icon,
                  color: kMarronColor,
                ),
                label: Text(widget.labelText),
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: myFocusNode.hasFocus ? kGreyColor : kGreyColor,
                ),
                border: InputBorder.none,
                focusColor: kMarronColor),
            cursorColor: kMarronColor,
            keyboardType: widget.textInputType,
            obscureText: widget.obscureText,
            validator: (e) {
              if (widget.validator != null) {
                return widget.validator!(e);
              }
              if (e == null || e.isEmpty) {
                return '${widget.labelText} is required';
              }
              return null;
            },
            onChanged: (e) {
              if (widget.onChanged == null) {
                return;
              }
              widget.onChanged!(e);
            },
            onSaved: (e) {
              if (widget.onSave == null) {
                return;
              }
              widget.onSave!(e);
            },
          )),
    );
  }
}

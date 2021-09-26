import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// Autofocus the textfield.
  bool autofocus;

  /// Initial value for the textfield
  String initialValue;

  /// If the text field should be read only.
  bool readOnly;

  /// Callback function called when the text field value changes.
  Function(String)? onChanged;

  /// Callback function. Called when the user submit the text field.
  Function(String)? onSubmitted;

  EdgeInsetsGeometry padding = EdgeInsets.symmetric(vertical: 20, horizontal: 5);

  TextInputType textInputType;

  String input = "";

  CustomTextField({
    this.autofocus = false,
    this.initialValue = "",
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        print("focus change");
        if (!hasFocus) {
          // Text field just lost focus.
          if (this.onSubmitted != null) {
            onSubmitted!(input);
          }
        }
      },
      child: Padding(
        padding: padding,
        child: CupertinoTextFormFieldRow(
          keyboardType: textInputType,
          controller: TextEditingController(text: initialValue),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Color(0xFF3F3F3F), width: 0.6),
            borderRadius: BorderRadius.circular(10),
          ), // OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), borderRadius: 10)
          placeholder: "Translation",
          placeholderStyle: TextStyle(color: Color(0xFF3F3F3F)),
          style: TextStyle(color: Colors.white),
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          onChanged: (String word) {
            input = word;
            if (this.onChanged != null) {
              onChanged!(word);
            }
          },
          onFieldSubmitted: (String word) {
            if (this.onSubmitted != null) {
              onSubmitted!(word);
            }
          },
          autofocus: autofocus,
          readOnly: readOnly,
        ),
      ),
    );
  }
}

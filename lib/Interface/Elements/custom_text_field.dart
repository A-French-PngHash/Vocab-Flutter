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

  CustomTextField({this.autofocus = false, this.initialValue = "", this.readOnly = false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: CupertinoTextFormFieldRow(
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
          if (this.onChanged != null) {
            onChanged!(word);
          }
        },
        autofocus: autofocus,
        readOnly: readOnly,
      ),
    );
  }
}

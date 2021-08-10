import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:vocab/Data/Model/language.dart';
import 'package:vocab/Pages/Elements/language_picker/select_language.dart';

/// The whole picker element to pick a language.
///
/// Contains both the picking preview and the transition to the screen that
/// actually picks the language.
class LanguagePicker extends StatelessWidget {
  /// The currently selected language.
  final Language currentlySelected;

  /// Text to be displayed on the picker preview.
  final String text;

  /// Callback when the user selected its language.
  final Function(Language) onSelect;

  LanguagePicker(this.currentlySelected, this.text, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        Language chosenLanguage = await Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => SelectLanguage(currentlySelected)));
        onSelect(chosenLanguage);
      },
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          Spacer(),
          Text(
            representationFor(this.currentlySelected),
            style: TextStyle(color: Color(0xFF94949B), fontSize: 17),
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 25,
            color: Color(0xFF94949B),
          ),
        ],
      ),
    );
  }
}

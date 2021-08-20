import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:vocab/Data/Model/language.dart';
import 'package:vocab/Data/Model/picker_enum_asbtract.dart';
import 'package:vocab/Pages/Elements/language_picker/select_data.dart';

/// The whole picker element to pick data from a PickerData.
///
/// Contains both the picking preview and the transition to the screen that
/// actually picks the language.
class Picker extends StatelessWidget {
  /// Text to be displayed on the picker preview.
  final String text;

  /// Callback when the user selected its language.
  final Function(String) onSelect;

  final PickerData elements;

  Picker(this.text, this.elements, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        String? chosenData = await Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => SelectFromData(elements)));
        if (chosenData == null) {
          onSelect(elements.currentlySelected);
        } else {
          onSelect(chosenData);
        }
      },
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          Spacer(),
          Text(
            this.elements.nameFor(this.elements.currentlySelected),
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

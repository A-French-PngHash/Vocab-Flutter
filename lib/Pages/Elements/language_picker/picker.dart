import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
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

  final List<String> elements;
  String currentlySelected;

  /// Formatting function to display elements. This function will be applied to 
  /// every element before showing them on the screen. If it is not set in the
  /// constructor, it will return the string as is.
  String Function(String) format = (String e) => e;

  Picker({
    required this.text,
    required this.elements,
    required this.currentlySelected,
    required this.onSelect,
    String Function(String)? format_func,
  }) {
    if (format_func != null) { // The format func parameter is optional.
      format = format_func;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        String? chosenData = await Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => SelectFromData(elements, currentlySelected, format)));
        if (chosenData == null) {
          onSelect(currentlySelected);
        } else {
          onSelect(chosenData);
        }
      },
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ), // Text describing what the picker is selecting.
          Spacer(),
          Text(
            format(this.currentlySelected),
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

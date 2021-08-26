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

  /// The minimal number of element the user must select.
  final int minElements;

  /// The maximal number of element the user may select.
  final int maxElements;

  /// Callback when the user made its choice. The list of string is all the
  /// elements he chose. Is at least the length of [minElements] and at max the
  /// length of [maxElements].
  final Function(List<String>) onSelect;

  final List<String> elements;

  /// List of all the elements currently selected. Must be at least of length
  /// one.
  List<String> currentlySelected;

  String get _currentlySelectedDisplayed {
    final firstElementFormated = format(currentlySelected[0]);
    if (currentlySelected.length == 1) {
      return firstElementFormated;
    } else {
      return firstElementFormated + " +" + (currentlySelected.length - 1).toString() + " more...";
    }
  }

  /// Formatting function to display elements. This function will be applied to
  /// every element before showing them on the screen. If it is not set in the
  /// constructor, it will return the string as is.
  String Function(String) format = (String e) => e;

  Picker({
    required this.text,
    required this.elements,
    required this.currentlySelected,
    required this.onSelect,
    required this.minElements,
    required this.maxElements,
    String Function(String)? format_func,
  }) {
    if (format_func != null) {
      // The format func parameter is optional.
      format = format_func;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        List<String>? chosenData = await Navigator.of(context)
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
            _currentlySelectedDisplayed,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:path/path.dart';
import 'package:vocab/Cubits/picker_cubit/picker_cubit.dart';
import 'package:vocab/Interface/Elements/language_picker/select_data.dart';

/// The whole picker element to pick data from a PickerData.
///
/// Contains both the picking preview and the transition to the screen that
/// actually picks the language.
class Picker extends StatelessWidget {
  /// Function called whenever the state changes from presented to row.
  Function(PickerCubit) onSelect;

  List<String> elements;
  List<String> currentlySelected;
  String Function(String) format;
  String description;
  int minElements;
  int maxElements;

  Picker(
      {required this.onSelect,
      required this.elements,
      required this.currentlySelected,
      required this.format,
      required this.description,
      required this.minElements,
      required this.maxElements}) {
    print("Creatin picker : $description");
  }

  @override
  Widget build(BuildContext context) {
    return buildRowView(context, description, currentlySelectedString);
  }

  Widget buildRowView(BuildContext context, String description, String currently_selected) {
    return TextButton(
      child: Row(
        children: [
          Text(
            description,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ), // Text describing what the picker is selecting.
          Spacer(),
          Text(
            currently_selected,
            style: TextStyle(color: Color(0xFF94949B), fontSize: 17),
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 25,
            color: Color(0xFF94949B),
          ),
        ],
      ),
      onPressed: () async {
        final cubit = PickerCubit(elements, currentlySelected, format, description, minElements, maxElements);
        await Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => cubit,
              child: SelectFromData(),
            ),
          ),
        );
        onSelect(cubit);
      },
    );
  }

  String get currentlySelectedString {
    String currently_selected_string = "";
    if (currentlySelected.length > 1) {
      currently_selected_string =
          format(currentlySelected[0]) + " +" + (currentlySelected.length - 1).toString() + " more...";
    } else {
      currently_selected_string = format(currentlySelected[0]);
    }
    return currently_selected_string;
  }
}

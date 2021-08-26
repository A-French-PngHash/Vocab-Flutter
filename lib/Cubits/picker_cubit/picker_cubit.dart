import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picker_state.dart';
part 'picker_cubit.freezed.dart';

class PickerCubit extends Cubit<PickerState> {
  /// Format function. Used before presenting any elements of the picker to the
  /// user.
  final String Function(String) format;

  /// List of elements of the picker. Not in formated state.
  final List<String> elements;

  String description;

  /// List of elements currently selected. Not in formated state.
  List<String> currentlySelected;

  //late List<String> elements_formated;

  PickerCubit(this.elements, this.currentlySelected, this.format, this.description)
      : super(PickerState.initial(description, "Loading...")) {
    emitInitial();
  }

  void emitInitial() {
    String currently_selected_string = "";
    if (currentlySelected.length > 1) {
      currently_selected_string =
          currently_selected_string[0] + " +" + (currentlySelected.length - 1).toString() + " more...";
    } else {
      currently_selected_string = currently_selected_string[0];
    }
    emit(PickerState.initial(description, currently_selected_string));
  }
}

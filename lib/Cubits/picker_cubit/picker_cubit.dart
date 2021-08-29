import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picker_state.dart';
part 'picker_cubit.freezed.dart';

class PickerCubit extends Cubit<PickerState> {
  /// Format function. Used before presenting any elements of the picker to the
  /// user.
  final String Function(String) _format;

  /// List of elements of the picker. Not in formated state.
  final List<String> _elements;

  String _description;

  /// List of elements currently selected. Not in formated state.
  List<String> currentlySelected;

  /// List of elements of the picker. In formated state.
  late List<String> _elementsFormated;

  late List<String> currentlySelectedFormated;

  /// If the widget is currently being displayed full screen.
  bool isPresented = false;

  /// The minimal number of element the user must select.
  final int _minElements;

  /// The maximal number of element the user may select.
  final int _maxElements;

  PickerCubit(
      this._elements, this.currentlySelected, this._format, this._description, this._minElements, this._maxElements)
      : super(PickerState.presented(_elements, currentlySelected)) {
    assert(_minElements <= _maxElements);
    _elementsFormated = _elements.map((e) => _format(e)).toList();
    currentlySelectedFormated = currentlySelected.map((e) => _format(e)).toList();
    _emitState();
    isPresented = true;
  }

  void _emitRow() {
    String currently_selected_string = "";
    if (currentlySelected.length > 1) {
      currently_selected_string =
          _format(currently_selected_string[0]) + " +" + (currentlySelected.length - 1).toString() + " more...";
    } else {
      currently_selected_string = _format(currentlySelected[0]);
    }
    //emit(PickerState.row(_description, currently_selected_string));
  }

  void popView() {
    this.isPresented = false;
    _emitState();
  }

  /// Emit the presented state.
  void _emitFullscreen() {
    emit(PickerState.presented(_elementsFormated, currentlySelectedFormated));
  }

  /// Emit the state. Automatically emit the correct state (initial or presented).
  void _emitState() {
    _emitFullscreen();
  }

  void userTappedOnElementRow(String element_formated) {
    final String element_non_formated = _elements[_elementsFormated.indexOf(element_formated)];

    if (_minElements == 1 && _maxElements == 1) {
      currentlySelected = [element_non_formated];
      isPresented = false;
    } else {
      if (currentlySelected.contains(element_non_formated)) {
        // Element was already selected.
        if (currentlySelected.length > _minElements) {
          currentlySelected.remove(element_non_formated);
        }
      } else {
        // Element wasn't already selected.
        if (currentlySelected.length < _maxElements) {
          currentlySelected.add(element_non_formated);
        }
      }
    }
    currentlySelectedFormated = currentlySelected.map((e) => _format(e)).toList();
    _emitState();
  }
}

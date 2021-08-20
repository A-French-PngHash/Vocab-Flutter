import 'package:vocab/Pages/Elements/language_picker/picker.dart';

abstract class PickerData {
  String currentlySelected = "";
  List<String> values = [];

  PickerData();

  /// Abstract class for picker data.
  String nameFor(String value);

  @override
  bool operator ==(other) {
    return other is PickerData && (other.currentlySelected == currentlySelected);
  }

  @override
  int get hashCode => values.indexOf(currentlySelected);
}

part of 'picker_cubit.dart';

@freezed
abstract class PickerState with _$PickerState {
  /// Initial state, when the picker is just a row on the screen.
  /// 
  /// - description_text : Text to describe what the picker is picking.
  /// - currentlySelected : Text that says what is currently selected. If multiple elements, then it may have ... at the end.
  const factory PickerState.initial(
      String description_text, String currentlySelected) = _Initial;

  /// Presented state. At this state, the picker is full screen and the user is 
  /// picking the data.
  /// 
  /// - elements : A list of all the elements the user can choose from.
  /// - currentlySelected : All elements currently selected elements.
  const factory PickerState.presented(List<String> elements, List<String> currentlySelected) = _Presented;
}

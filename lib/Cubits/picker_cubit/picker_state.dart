part of 'picker_cubit.dart';

@freezed
abstract class PickerState with _$PickerState {
  /// Presented state. At this state, the picker is full screen and the user is 
  /// picking the data.
  /// 
  /// - elements : A list of all the elements the user can choose from. Is 
  /// formated to be displayed correctly to the user (using the [format] 
  /// function passed to the cubit during instanciation).
  /// - currentlySelected : All elements currently selected elements.
  const factory PickerState.presented(List<String> elements, List<String> currentlySelected) = _Presented;
}

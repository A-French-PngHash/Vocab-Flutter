part of 'main_menu_cubit.dart';

@freezed
class MainMenuCubitState with _$MainMenuCubitState {
  factory MainMenuCubitState.menu({@required Language? originLanguage, @required Language? outputLanguage}) = _MainMenuCubitState;
}

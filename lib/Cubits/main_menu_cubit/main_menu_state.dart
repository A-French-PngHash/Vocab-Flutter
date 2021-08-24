part of 'main_menu_cubit.dart';

@freezed
class MainMenuCubitState with _$MainMenuCubitState {
  factory MainMenuCubitState.menu({required String originLanguage, required String outputLanguage, required String currentUser}) = _MainMenuCubitState;
}

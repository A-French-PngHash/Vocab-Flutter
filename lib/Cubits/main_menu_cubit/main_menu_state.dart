part of 'main_menu_cubit.dart';

@freezed
class MainMenuCubitState with _$MainMenuCubitState {
  factory MainMenuCubitState.loading() = _Loading;
  factory MainMenuCubitState.menu(
      {required List<String> themes, required List<String> currentlySelectedTheme, required String originLanguage, required String outputLanguage, required String currentUser, required int numberOfTranslationToDo, required bool hasSessionToContinue}) = _MainMenuCubitState;
}

part of 'main_menu_cubit.dart';

@freezed
class MainMenuCubitState with _$MainMenuCubitState {
  factory MainMenuCubitState.loading() = _Loading;
  factory MainMenuCubitState.menu(
      {required String originLanguage,
      required String outputLanguage,
      required String currentUser,
      required List<String> themes}) = _MainMenuCubitState;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  String currentUser = "tymeo";
  List<String> themes = ["Loading..."];

  /// Original language. Default value.
  String originLanguage = "french";

  /// Output language. Default value.
  String outputLanguage = "english";

  set themesChosen(List<String> e) {
    print("Changing themesChosen to $e, before : $_themesChosen");
    _themesChosen = e;
  }

  List<String> get themesChosen {
    return _themesChosen;
  }

  /// List of themes chosen by the user.
  List<String> _themesChosen = [];

  /// Return the key for current user to access the shared preferences of the
  /// theme choice.
  String get userThemeChoiceKey {
    return this.currentUser + "ThemeChoosen";
  }

  MainMenuCubit() : super(MainMenuCubitState.loading()) {
    print("Initializing cubit");
    refreshThemes().then((value) => emitState());
  }

  /// Refresh [themes] by fetching them from a new wordRepo instance.
  Future<void> refreshThemes() async {
    final wordRepo = WordRepo(this.currentUser);
    this.themes = await wordRepo.theme_names;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(userThemeChoiceKey)) {
      themesChosen = prefs.getStringList(userThemeChoiceKey)!;
    } else {
      themesChosen = [this.themes[0]];
    }
    emitState();
  }

  void outputLanguageSelected(String language) {
    this.outputLanguage = language;
    emitState();
  }

  void originLanguageSelected(String language) {
    this.originLanguage = language;
    emitState();
  }

  void currentUserSelected(String user) async {
    if (this.currentUser != user) {
      this.currentUser = user;
      await refreshThemes();
      emitState();
    }
  }

  void themesSelected(List<String> themes) async {
    this.themesChosen = themes;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(userThemeChoiceKey, this.themesChosen);
    emit(MainMenuCubitState.loading()); // Emiting this first, otherwise, view doesn't get refreshed for some reason.
    emitState();
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    print("emiting state");
    print(themesChosen);
    emit(MainMenuCubitState.menu(
        themes: this.themes,
        currentUser: currentUser,
        currentlySelectedTheme: themesChosen,
        originLanguage: originLanguage,
        outputLanguage: outputLanguage));
  }
}

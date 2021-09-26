import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  /// User used when the app is opened for the first time.
  static const String defaultFirstUser = "tymeo";
  static const int defaultNumberOfTranslationToDo = 50;
  late SharedPreferences prefs;

  String? _currentUser;
  String get currentUser {
    if (_currentUser == null) {
      if (prefs.containsKey(currentUserKey)) {
        _currentUser = prefs.getString(currentUserKey)!;
      } else {
        currentUser = defaultFirstUser;
      }
    }

    return _currentUser!;
  }

  set currentUser(String new_value) {
    _numberOfTranslationToDo = null;
    _currentUser = new_value;
    prefs.setString(currentUserKey, new_value);
  }

  int? _numberOfTranslationToDo;
  int get numberOfTranslationToDo {
    if (_numberOfTranslationToDo == null) {
      if (prefs.containsKey(keyUserNumberOfTranslationToDo)) {
        _numberOfTranslationToDo = prefs.getInt(keyUserNumberOfTranslationToDo);
      } else {
        numberOfTranslationToDo = defaultNumberOfTranslationToDo;
      }
    }
    return _numberOfTranslationToDo!;
  }

  set numberOfTranslationToDo(int newValue) {
    _numberOfTranslationToDo = newValue;
    prefs.setInt(keyUserNumberOfTranslationToDo, newValue);
  }

  /// The key to access the number of translation to do for the current user in
  /// shared preferences.
  String get keyUserNumberOfTranslationToDo {
    return currentUser + "nbTranslationToDo";
  }

  List<String> themes = ["Loading..."];

  /// Original language. Default value.
  String originLanguage = "french";

  /// Output language. Default value.
  String outputLanguage = "english";

  set chosenThemes(List<String> e) {
    print("Changing themesChosen to $e, before : $_themesChosen");
    _themesChosen = e;
  }

  List<String> get chosenThemes {
    return _themesChosen;
  }

  /// List of themes chosen by the user.
  List<String> _themesChosen = [];

  /// Return the key for current user to access the shared preferences of the
  /// theme choice.
  String get userThemeChoiceKey {
    return this.currentUser + "ThemeChoosen";
  }

  /// The key to access the current selected user stored in SharedPreferences.
  String currentUserKey = "user";

  MainMenuCubit() : super(MainMenuCubitState.loading()) {
    print("Initializing main menu cubit");

    this.loadAsync().then((value) => emitState());
  }

  /// All async loading code grouped into one function.
  Future<void> loadAsync() async {
    this.prefs = await SharedPreferences.getInstance();
    await refreshThemes();
  }

  /// Refresh [themes] by fetching them from a new wordRepo instance.
  Future<void> refreshThemes() async {
    final wordRepo = WordRepo(this.currentUser);
    this.themes = await wordRepo.theme_names;
    if (prefs.containsKey(userThemeChoiceKey)) {
      chosenThemes = prefs.getStringList(userThemeChoiceKey)!;
    } else {
      chosenThemes = [this.themes[0]];
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

  void numberOfTranslationTodoChanged(int newValue) async {
    numberOfTranslationToDo = newValue;
    emitState();
  }

  void themesSelected(List<String> themes) async {
    this.chosenThemes = themes;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(userThemeChoiceKey, this.chosenThemes);
    emit(MainMenuCubitState.loading()); // Emiting this first, otherwise, view doesn't get refreshed for some reason.
    emitState();
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    emit(MainMenuCubitState.menu(
        themes: this.themes,
        currentUser: currentUser,
        currentlySelectedTheme: chosenThemes,
        originLanguage: originLanguage,
        outputLanguage: outputLanguage,
        numberOfTranslationToDo: numberOfTranslationToDo));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Repositories/db_session_repo.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  /// User used when the app is opened for the first time.
  static const String defaultFirstUser = "tymeo";
  static const int defaultNumberOfTranslationToDo = 50;
  late SharedPreferences prefs;

  /// Last session the currently selected user did.
  Session? lastSessionForUser;
  String? _currentUser;
  int? _numberOfTranslationToDo;

  /// ----------
  /// Getters (for shared preferences values)
  /// ----------

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

  List<String> get chosenThemes {
    if (_themesChosen == null) {
      if (prefs.containsKey(userThemeChoiceKey)) {
        chosenThemes = prefs.getStringList(userThemeChoiceKey)!;
      } else {
        _themesChosen = [this.themes![0]];
      }
    }
    return _themesChosen!;
  }

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

  /// ----------
  /// Setters (for shared preferences values)
  /// ----------

  set numberOfTranslationToDo(int newValue) {
    _numberOfTranslationToDo = newValue;
    prefs.setInt(keyUserNumberOfTranslationToDo, newValue);
  }

  set chosenThemes(List<String> newValue) {
    _themesChosen = newValue;
    prefs.setStringList(userThemeChoiceKey, newValue);
  }

  set currentUser(String newValue) {
    _currentUser = newValue;
    _numberOfTranslationToDo = null;
    _themesChosen = null;
    prefs.setString(currentUserKey, newValue);
  }

  /// ----------
  /// Keys for shared preferences
  /// ----------

  /// The key for to access the shared preferences of the chosen themes for this
  /// user
  String get userThemeChoiceKey {
    return this.currentUser + "ThemeChoosen";
  }

  /// The key to access the current selected user stored in SharedPreferences.
  String currentUserKey = "user";

  /// The key to access the number of translation to do for the current user in
  /// shared preferences.
  String get keyUserNumberOfTranslationToDo {
    return currentUser + "nbTranslationToDo";
  }

  /// ----------
  /// Functions
  /// ----------
  MainMenuCubit() : super(MainMenuCubitState.loading()) {
    print("Initializing main menu cubit");

    this.loadAsync().then((value) => emitState());
  }

  /// All async loading code grouped into one function.
  Future<void> loadAsync() async {
    this.prefs = await SharedPreferences.getInstance();
    this.lastSessionForUser = await DbSessionRepo.lastSessionFromUser(this.currentUser);
    await refreshThemes();
  }

  /// Refresh [themes] by fetching them from a new wordRepo instance.
  Future<void> refreshThemes() async {
    final wordRepo = WordRepo(this.currentUser);
    this.themes = await wordRepo.theme_names;
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
      this.lastSessionForUser = await DbSessionRepo.lastSessionFromUser(this.currentUser);
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
    emit(MainMenuCubitState.loading()); // Emiting this first, otherwise, view doesn't get refreshed for some reason.
    emitState();
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    emit(MainMenuCubitState.menu(
        themes: this.themes!,
        currentUser: currentUser,
        currentlySelectedTheme: chosenThemes,
        originLanguage: originLanguage,
        outputLanguage: outputLanguage,
        numberOfTranslationToDo: numberOfTranslationToDo,
        hasSessionToContinue : this.lastSessionForUser != null && this.lastSessionForUser!.endDate == null));
  }
}

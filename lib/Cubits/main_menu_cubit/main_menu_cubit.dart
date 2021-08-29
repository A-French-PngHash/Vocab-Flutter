import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  String currentUser = "tymeo";
  List<String> themes = ["Loading..."];

  /// Original language. Default value.
  String originLanguage = "french";

  /// Output language. Default value.
  String outputLanguage = "english";

  /// List of themes chosen by the user.
  List<String> themesChosen = [];

  MainMenuCubit() : super(MainMenuCubitState.loading()) {
    refreshThemes().then((value) => emitState());
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
      await refreshThemes();
      emitState();
    }
  }

  void themesSelected(List<String> themes) {
    this.themesChosen = themes;
    emitState();
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    emit(MainMenuCubitState.menu(
        themes: this.themes,
        currentUser: currentUser,
        currentlySelectedTheme: themesChosen,
        originLanguage: originLanguage,
        outputLanguage: outputLanguage));
  }
}

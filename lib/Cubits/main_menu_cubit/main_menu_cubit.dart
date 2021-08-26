import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  String originLanguage = "french";
  String outputLanguage = "english";
  String currentUser = "tymeo";
  List<String> themes = [];

  MainMenuCubit() : super(MainMenuCubitState.loading()) {
    refreshThemes().then((value) => emitState());
  }

  /// Refresh [themes] by fetching them from a new wordRepo instance.
  Future<void> refreshThemes() async {
    final wordRepo = WordRepo(this.currentUser);
    themes = await wordRepo.theme_names;
  }

  void originLanguageSelected(String language) {
    this.originLanguage = language;
    emitState();
  }

  void outputLanguageSelected(String language) {
    this.outputLanguage = language;
    emitState();
  }

  void currentUserSelected(String user) {
    if (this.currentUser != user) {
      this.currentUser = user;
      refreshThemes();
      emitState();
    }
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    emit(MainMenuCubitState.menu(
        originLanguage: originLanguage, outputLanguage: outputLanguage, currentUser: currentUser, themes: themes));
  }
}

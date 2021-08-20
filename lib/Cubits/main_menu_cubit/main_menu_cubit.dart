import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vocab/Data/Model/user.dart';
import '../../Data/Model/language.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  Language originLanguage = Language("french");
  Language outputLanguage = Language("english");
  User currentUser = User("tymeo");

  MainMenuCubit()
      : super(MainMenuCubitState.menu(
            originLanguage: Language("french"), outputLanguage: Language("english"), currentUser: User("tymeo")));

  void originLanguageSelected(String language) {
    this.originLanguage = Language(language);
    emitState();
  }

  void outputLanguageSelected(String language) {
    this.outputLanguage = Language(language);
    emitState();
  }

  void currentUserSelected(String user) {
    this.currentUser = User(user);
    emitState();
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    emit(MainMenuCubitState.menu(
        originLanguage: originLanguage, outputLanguage: outputLanguage, currentUser: currentUser));
  }
}

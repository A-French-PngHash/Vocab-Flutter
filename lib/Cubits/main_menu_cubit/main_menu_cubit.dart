import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  String originLanguage = "french";
  String outputLanguage = "english";
  String currentUser = "tymeo";

  MainMenuCubit()
      : super(MainMenuCubitState.menu(
            originLanguage: "french", outputLanguage: "english", currentUser: "tymeo"));

  void originLanguageSelected(String language) {
    this.originLanguage = language;
    emitState();
  }

  void outputLanguageSelected(String language) {
    this.outputLanguage = language;
    emitState();
  }

  void currentUserSelected(String user) {
    this.currentUser = user;
    emitState();
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    emit(MainMenuCubitState.menu(
        originLanguage: originLanguage, outputLanguage: outputLanguage, currentUser: currentUser));
  }
}

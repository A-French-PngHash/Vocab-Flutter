import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../Data/Model/language.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_menu_state.dart';

part 'main_menu_cubit.freezed.dart';

class MainMenuCubit extends Cubit<MainMenuCubitState> {
  Language originLanguage = Language.french;
  Language outputLanguage = Language.english;

  MainMenuCubit() : super(MainMenuCubitState.menu(originLanguage: Language.french, outputLanguage: Language.english));

  void originLanguageSelected(Language language) {
    this.originLanguage = language;
    emitState();
  }

  void outputLanguageSelected(Language language) {
    this.outputLanguage = language;
    emitState();
  }

  /// Emit the current state by using the data available in the class.
  void emitState() {
    emit(MainMenuCubitState.menu(originLanguage: originLanguage, outputLanguage: outputLanguage));
  }
}

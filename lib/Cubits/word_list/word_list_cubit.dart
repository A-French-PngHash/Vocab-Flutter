import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Model/ThemeModel.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';

part 'word_list_state.dart';
part 'word_list_cubit.freezed.dart';

class WordListCubit extends Cubit<WordListState> {
  WordRepo _wordRepo;

  WordListCubit(List<String> selectedThemes, this._wordRepo) : super(WordListState.initial()) {
    _wordRepo.get_themes(names: selectedThemes).then((value) {
      emit(WordListState.loaded(themes: value));
    });
  }
}

part of 'word_list_cubit.dart';

@freezed
class WordListState with _$WordListState {
  const factory WordListState.initial() = _Initial;

  const factory WordListState.loaded({required List<ThemeModel> themes}) = _Loaded;
}

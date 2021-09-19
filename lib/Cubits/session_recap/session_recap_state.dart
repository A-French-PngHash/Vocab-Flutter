part of 'session_recap_cubit.dart';

@freezed
abstract class SessionRecapState with _$SessionRecapState {
  const factory SessionRecapState.initial() = _Initial;

  const factory SessionRecapState.error(String errorMessage) = _Error;

  const factory SessionRecapState.data(Session sessionData, List<WordDb> wordData) = _Data;
}

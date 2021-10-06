import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';
import 'package:vocab/Data/Repositories/db_session_repo.dart';
import 'package:vocab/Data/Repositories/db_word_repo.dart';

part 'session_recap_state.dart';
part 'session_recap_cubit.freezed.dart';

class SessionRecapCubit extends Cubit<SessionRecapState> {
  final int session_id;

  late final Session? session;
  late final List<WordDb>? words;

  /// Potential error message. If not null, [emitState] will automatically emit
  /// the correct state.
  String? errorMessage;

  SessionRecapCubit(this.session_id) : super(SessionRecapState.initial()) {
    loadData().then((value) {
      emitState();
    });
  }

  Future<void> loadData() async {
    this.session = await DbSessionRepo.getSession(session_id);
    if (session == null) {
      errorMessage = "Unknown session with id $session_id";
      await emitState();
    }
    this.words = await DbWordRepo.getWords(session_id);
  }

  /// Emit the current state inteligently. Uses the data stored in this cubit
  /// to automatically emit the right state.
  Future<void> emitState() async {
    if (errorMessage != null) {
      emit(SessionRecapState.error(errorMessage!));
    } else if (session == null || words == null) {
      emit(SessionRecapState.initial());
    } else {
      emit(SessionRecapState.data(session!, words!));
    }
  }
}

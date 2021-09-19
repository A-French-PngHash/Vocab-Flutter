import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/session_recap/session_recap_cubit.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';

/// Recap of every word shown in this session, as well as information about
/// them.
class SessionRecap extends StatelessWidget {
  final int session_id;

  SessionRecap(this.session_id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<SessionRecapCubit, SessionRecapState>(
        builder: (context, state) {
          return state.when(initial: () {
            return buildInitial(context);
          }, data: (Session session, List<WordDb> words) {
            return buildDataView(context, session, words);
          }, error: );
        },
      ),
    );
  }

  Widget buildInitial(BuildContext context) {
    return Center(
      child: Text("Loading..."),
    );
  }

  Widget buildErrorView(BuildContext context, String errorDescription) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [Icon(Icons.error), Text("Uh oh, an error occured...")],
          ),
          Text(errorDescription),
        ],
      ),
    );
  }

  Widget buildDataView(BuildContext context, Session session, List<WordDb> words) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Session started at : ${session.beginDate.toString()}",
            style: TextStyle(fontSize: 25),
          ),
          buildCorrectRecap(true, session.correct),
          buildCorrectRecap(false, session.incorrect),
          ...words.map((e) => Text(e.expectedTranslation)),
        ],
      ),
    );
  }

  Widget buildCorrectRecap(bool correct, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          correct ? Icons.done_rounded : Icons.close,
          size: 50,
          color: Colors.red,
        ),
        Text(
          " : $count",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

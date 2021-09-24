import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/session_recap/session_recap_cubit.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';

/// Recap of every word shown in this session, as well as information about
/// them.
class SessionRecap extends StatelessWidget {
  final int sessionId;

  SessionRecap(this.sessionId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Session Recap",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          previousPageTitle: "Menu",
        ),
        child: BlocBuilder<SessionRecapCubit, SessionRecapState>(
          builder: (context, state) {
            return state.when(initial: () {
              return buildInitial(context);
            }, data: (Session session, List<WordDb> words) {
              return buildDataView(context, session, words);
            }, error: (String errorDescription) {
              return buildErrorView(context, errorDescription);
            });
          },
        ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Colors.red,
              ),
              Text("Uh oh, an error occured...")
            ],
          ),
          Text(errorDescription),
        ],
      ),
    );
  }

  Widget buildDataView(BuildContext context, Session session, List<WordDb> words) {
    final DateTime beginDate = session.beginDate.toLocal();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Session started on the ${beginDate.day}/${beginDate.month}/${beginDate.year} at ${beginDate.hour}:${beginDate.minute}",
            textAlign: TextAlign.center,
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
          color: correct ? Colors.green : Colors.red,
        ),
        Text(
          " : $count",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

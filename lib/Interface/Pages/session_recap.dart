import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/session_recap/session_recap_cubit.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';
import 'package:vocab/Services/capextension_string.dart';

/// Recap of every word shown in this session, as well as information about
/// them.
class SessionRecap extends StatelessWidget {
  final int sessionId;

  SessionRecap(this.sessionId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Session Recap",
          ),
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80, left: 10, right: 10),
          child: Text(
            "Session started on the ${beginDate.day}/${beginDate.month}/${beginDate.year} at ${beginDate.hour}:${beginDate.minute}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
        ),
        buildCorrectRecap(true, session.correct),
        buildCorrectRecap(false, session.incorrect),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: words.length,
            itemBuilder: (BuildContext context, int index) {
              final element = words[index];
              return Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        stateIcon(element.expectedTranslation == element.inputedTranslaton, size: 30),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            element.wordShown.capitalize(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Expected : "),
                                  Text(
                                    element.expectedTranslation,
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("You wrote : "),
                                  Text(
                                    element.inputedTranslaton,
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider()
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildCorrectRecap(bool correct, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        stateIcon(correct, size: 50),
        Text(
          " : $count",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }

  /// Generates the state icon (correct/incorrect) depending on whether correct
  /// is set to true.
  Icon stateIcon(bool correct, {double size = 50}) {
    return Icon(
      correct ? Icons.done_rounded : Icons.close,
      size: size,
      color: correct ? Colors.green : Colors.red,
    );
  }
}

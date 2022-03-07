import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/session_recap/session_recap_cubit.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:vocab/Interface/Elements/button/gradient_button.dart';
import 'package:vocab/Interface/Pages/session_recap.dart';

class TrainingPage extends StatelessWidget {
  static const double correctionFontSize = 20;

  final focusNode = FocusNode();

  /// User currently doing the word series.
  final String user;

  /// Language the user is translating to.
  final String translateToLanguage;

  /// The current input in the text field.
  String wordInputed = "";

  /// The total number of translation the user will do in the series.
  final int numberOfTranslationToDo;

  /// Unix timestamp where the eventual dialog showing a grammar rule showed up.
  /// This is used to add a 1 second delay before the user can click next.
  int? dialogShowedAt;

  /// Delay before the dialog can be dismissed. In milliseconds.
  int dialogDelay = 1500;

  /// Title of the navigation bar.
  String navbarTitle;

  TrainingPage(this.translateToLanguage, this.numberOfTranslationToDo, this.user, this.navbarTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TrainingCubit, TrainingState>(
        builder: (context, state) {
          return state.maybeWhen(initial: () {
            return loadingView();
          }, word:
              (String wordToTranslate, String? comment, int wordNumber, String textUnderField, Color textFieldColor) {
            return viewV2(context, wordToTranslate, comment, wordNumber, textUnderField, textFieldColor);
          }, correction: (String wordToTranslate, bool correct, String correctTranslation, String inputedTranslation,
              int wordNumber, String? comment, _, String textUnderField, Color textFieldColor) {
            return viewV2(
              context,
              wordToTranslate,
              comment,
              wordNumber,
              textUnderField,
              textFieldColor,
              correct: correct,
              correctTranslation: correctTranslation,
              inputedTranslation: inputedTranslation,
            );
          }, finished: (int correct, int incorrect) {
            return buildFinishedView(context, correct, incorrect);
          }, orElse: () {
            return Text("Unknown state");
          });
        },
        listener: (context, state) {
          state.maybeWhen(
              correction: (String wordToTranslate, bool correct, String correctTranslation, String translationInputed,
                  int wordNumber, String? comment, String? grammarRule, String textUnderField, Color textFieldColor) {
                if (grammarRule != null) {
                  dialogShowedAt = DateTime.now().millisecondsSinceEpoch;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Flex(
                        direction: Axis.vertical,
                        children: [
                          Expanded(
                            child: CupertinoAlertDialog(
                              title: Text("Règle de grammaire :"),
                              content: Text(grammarRule),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Ok"),
                                  isDefaultAction: true,
                                  onPressed: () {
                                    if ((dialogShowedAt! + dialogDelay) < DateTime.now().millisecondsSinceEpoch) {
                                      // Waiting the delay before allowing the user to dismiss the popup.
                                      Navigator.of(context).pop();
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              orElse: () {});
        },
      ),
    );
  }

  Widget loadingView() {
    return Center(child: Text("Loading..."));
  }

  /// Generate the view for the training page. [V2] because this is the new theme currently being developped.
  ///
  /// * context : The current BuildContext.
  /// * wordToTranslate : The word the user has to translate.
  /// * comment : Optional additional information helping the user with the translation.
  /// * wordNumber : The how-manieth word this is.
  /// * correct : Has a value only if the user has submitted a translation. If true then the submitted translation was correct, otherwise, it is false.
  /// * correctTranslation : The right translation for the word.
  /// * inputedTranslation : The translation submitted by the user.
  Widget viewV2(
    BuildContext context,
    String wordToTranslate,
    String? comment,
    int wordNumber,
    String textUnderField,
    Color textFieldColor, {
    bool? correct,
    String correctTranslation = "",
    String inputedTranslation = "",
  }) {
    final controller = TextEditingController(text: (correct != null && correct) ? inputedTranslation : "");
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
              iconSize: 40,
            ),
            Container(
              width: 250,
              child: LinearProgressIndicator(
                value: wordNumber / numberOfTranslationToDo,
                color: Colors.blueGrey,
                backgroundColor: Colors.blueGrey.withOpacity(0.35),
                minHeight: 7,
              ),
            ),
            Icon(
              Icons.settings_outlined,
              size: 40,
            ),
          ]),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wordToTranslate,
                  style: TextStyle(fontSize: 45),
                ),
                if (comment != null) Text(comment),
                if (correct != null && !correct)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VOTRE RÉPONSE",
                          style: TextStyle(color: Colors.red, fontSize: correctionFontSize),
                        ),
                        Text(inputedTranslation, style: TextStyle(fontSize: correctionFontSize)),
                        Text("RÉPONSE CORRECTE",
                            style: TextStyle(color: Colors.green, fontSize: correctionFontSize + 10)),
                        Text(correctTranslation, style: TextStyle(fontSize: correctionFontSize + 10)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Spacer(),
          Column(children: [
            TextFormField(
              onChanged: (String word) {
                wordInputed = word;
              },
              onFieldSubmitted: (String word) {
                if (correct != null && correct == true) {
                  controller.text = "";
                  goToNextWord(context);
                } else {
                  wordInputed = word;
                  userSubmited(context);
                }
                focusNode.requestFocus();
              },
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 4, color: textFieldColor),
              )),
              cursorWidth: 0.3,
              cursorColor: Colors.black,
              focusNode: focusNode,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  textUnderField,
                  style: TextStyle(color: Color.fromRGBO(149, 155, 178, 1), fontSize: 13),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  /// Called when the user tapped the validate button or submited from the
  /// keyboard.
  void userSubmited(BuildContext context) {
    if (wordInputed.length > 0) {
      final cubit = context.read<TrainingCubit>();
      cubit.keyboardSubmit(wordInputed);
    }
  }

  /// User tapped the next button or validated from the keyboard, indicating he
  /// wants to jump to the next word.
  void goToNextWord(BuildContext context) {
    context.read<TrainingCubit>().nextWord(success: true);
  }

  Widget buildFinishedView(BuildContext context, int correct, int incorrect) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vous avez terminé votre série de $numberOfTranslationToDo mots!",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done_rounded,
                    size: 50,
                    color: Colors.green,
                  ),
                  Text(
                    " : $correct",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.close,
                    size: 50,
                    color: Colors.red,
                  ),
                  Text(
                    " : $incorrect",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              GradientButton(
                text: "More Info",
                onPressed: () => showSessionRecap(context),
              )
            ],
          ),
        ),
      ],
    );
  }

  void showSessionRecap(BuildContext context) {
    final cubit = context.read<TrainingCubit>();
    final sessionId = cubit.session.id!;
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (context) => SessionRecapCubit(sessionId),
            child: SessionRecap(sessionId),
          );
        },
      ),
    );
  }
}

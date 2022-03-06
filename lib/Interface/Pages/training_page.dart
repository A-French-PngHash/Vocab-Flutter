import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/session_recap/session_recap_cubit.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:vocab/Interface/Elements/button/gradient_button.dart';
import 'package:vocab/Interface/Elements/correct.dart';
import 'package:vocab/Interface/Elements/custom_text_field.dart';
import 'package:vocab/Interface/Elements/incorrect.dart';
import 'package:vocab/Interface/Elements/progress_bar.dart';
import 'package:vocab/Interface/Pages/session_recap.dart';
import 'package:vocab/Services/capextension_string.dart';

class TrainingPage extends StatelessWidget {
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
            //buildWordView(context, wordToTranslate, comment, wordNumber);
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
            /*if (correct) {
              return buildCorrectView(context, wordToTranslate, translationInputed, wordNumber, comment);
            } else {
              return buildIncorrectView(
                  context, wordToTranslate, correctTranslation, translationInputed, wordNumber, comment);
            }*/
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
            Icon(Icons.close),
            Container(
              width: 250,
              child: LinearProgressIndicator(
                value: wordNumber / numberOfTranslationToDo,
                color: Colors.blueGrey,
                backgroundColor: Colors.blueGrey.withOpacity(0.35),
                minHeight: 7,
              ),
            ),
            Icon(Icons.settings_outlined),
          ]),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wordToTranslate,
                  style: TextStyle(fontSize: 35),
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
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(inputedTranslation),
                        Text("RÉPONSE CORRECTE", style: TextStyle(color: Colors.green)),
                        Text(correctTranslation),
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

  /// Return the word view that contains, the word info (which word to translate
  ///  and in which language), the text field and the validation button.
  Widget buildWordView(BuildContext context, String wordToTranslate, String? comment, int wordNumber) {
    return Column(
      children: [
        _buildWordInfo(context, wordToTranslate, wordNumber, comment: comment),
        CustomTextField(
          autofocus: true,
          onChanged: (String word) {
            wordInputed = word;
          },
          onSubmitted: (String word) {
            wordInputed = word;
            userSubmited(context);
          },
        ),
        GradientButton(
          onPressed: () {
            userSubmited(context);
          },
          text: "Validate",
        ),
      ],
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

  /// Return the word info column, consists of which word to translate, and in which language.
  Widget _buildWordInfo(BuildContext context, String wordToTranslate, int wordNumber, {String? comment}) {
    wordInputed = "";
    return Column(
      children: [
        Row(
          children: [Spacer()],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: SegmentedProgressBar(
            nbElement: numberOfTranslationToDo,
            currentSegment: wordNumber,
            fullWidth: MediaQuery.of(context).size.width - 50,
          ),
        ),
        Text(
          "Translate to $translateToLanguage the word : ",
          style: TextStyle(color: Color(0xFFB1B1B1), fontSize: 15),
        ),
        Text(
          wordToTranslate.capitalizeFirstofEach,
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        if (comment != null) Text("Note : $comment")
      ],
    );
  }

  Widget buildCorrectView(
      BuildContext context, String wordToTranslate, String translationInputed, int wordNumber, String? comment) {
    return Column(children: [
      _buildWordInfo(context, wordToTranslate, wordNumber),
      CustomTextField(autofocus: true, initialValue: translationInputed, readOnly: true),
      SizedBox(height: 350, child: Correct()),
    ]);
  }

  Widget buildIncorrectView(BuildContext context, String wordToTranslate, String correctTranslation,
      String translationInputed, int wordNumber, String? comment) {
    return Column(children: [
      _buildWordInfo(context, wordToTranslate, wordNumber),
      CustomTextField(
        autofocus: true,
        initialValue: translationInputed,
        onChanged: (String word) {
          wordInputed = word;
        },
        onSubmitted: (String word) {
          wordInputed = word;
          goToNextWord(context);
        },
        readOnly: false,
      ),
      SizedBox(
        height: 350,
        child: Incorrect(correctTranslation, () {
          goToNextWord(context);
        }),
      ),
    ]);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:vocab/Interface/Elements/button/gradient_button.dart';
import 'package:vocab/Interface/Elements/correct.dart';
import 'package:vocab/Interface/Elements/custom_text_field.dart';
import 'package:vocab/Interface/Elements/incorrect.dart';
import 'package:vocab/Interface/Elements/progress_bar.dart';

class TrainingPage extends StatelessWidget {
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

  TrainingPage(this.translateToLanguage, this.numberOfTranslationToDo, this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Menu",
        middle: Text(
          "Training",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF121212),
      ),
      child: BlocConsumer<TrainingCubit, TrainingState>(
        builder: (context, state) {
          return state.maybeWhen(initial: () {
            return loadingView();
          }, word: (String wordToTranslate, String? comment, int wordNumber) {
            return buildWordView(context, wordToTranslate, comment, wordNumber);
          }, correction: (String wordToTranslate, bool correct, String correctTranslation, String translationInputed,
              int wordNumber, String? comment, String? grammarRule) {
            if (correct) {
              return buildCorrectView(context, wordToTranslate, translationInputed, wordNumber, comment, grammarRule);
            } else {
              return buildIncorrectView(
                  context, wordToTranslate, correctTranslation, translationInputed, wordNumber, comment, grammarRule);
            }
          }, finished: (int correct, int incorrect) {
            return buildFinishedView(context, correct, incorrect);
          }, orElse: () {
            return Text("Unknown state");
          });
        },
        listener: (context, state) {
          state.maybeWhen(
              correction: (String wordToTranslate, bool correct, String correctTranslation, String translationInputed,
                  int wordNumber, String? comment, String? grammarRule) {
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
    ));
  }

  Widget loadingView() {
    return Center(child:  Text("Loading..."));
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
        ),
        GradientButton(
          onPressed: () {
            if (wordInputed.length > 0) {
              final cubit = context.read<TrainingCubit>();
              cubit.userValidatedWord(wordInputed);
            }
          },
          text: "Validate",
        ),
      ],
    );
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

  Widget buildCorrectView(BuildContext context, String wordToTranslate, String translationInputed, int wordNumber,
      String? comment, String? grammarRule) {
    return Column(children: [
      _buildWordInfo(context, wordToTranslate, wordNumber),
      CustomTextField(autofocus: true, initialValue: translationInputed, readOnly: true),
      SizedBox(height: 350, child: Correct(grammarRule)),
    ]);
  }

  Widget buildIncorrectView(BuildContext context, String wordToTranslate, String correctTranslation,
      String translationInputed, int wordNumber, String? comment, String? grammarRule) {
    return Column(children: [
      _buildWordInfo(context, wordToTranslate, wordNumber),
      CustomTextField(
        autofocus: true,
        initialValue: translationInputed,
        onChanged: (String word) {
          wordInputed = word;
        },
        readOnly: false,
      ),
      SizedBox(
        height: 350,
        child: Incorrect(correctTranslation, grammarRule, () {
          context.read<TrainingCubit>().nextButtonPressed(wasIncorrect: true, correctionInputed: wordInputed);
        }),
      ),
    ]);
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
              )
            ],
          ),
        ),
      ],
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String get capitalizeFirstofEach => this.split(" ").map((str) => str.capitalize()).join(" ");
}

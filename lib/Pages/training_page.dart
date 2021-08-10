import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:vocab/Pages/Elements/button/gradient_button.dart';
import 'package:vocab/Pages/Elements/correct.dart';
import 'package:vocab/Pages/Elements/incorrect.dart';

class TrainingPage extends StatelessWidget {
  String translateToLanguage;
  String wordInputed = "";

  TrainingPage(this.translateToLanguage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: true,
        previousPageTitle: "Menu",
        middle: Text(
          "Training",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF121212),
      ),
      child: BlocBuilder<TrainingCubit, TrainingState>(builder: (context, state) {
        return state.maybeWhen(initial: () {
          return loadingView();
        }, word: (String wordToTranslate, String? comment) {
          return buildWordView(context, wordToTranslate, comment);
        }, correction:
            (String wordToTranslate, bool correct, String correctTranslation, String? comment, String? grammarRule) {
          if (correct) {
            return buildCorrectView(context, wordToTranslate, comment, grammarRule);
          } else {
            return buildIncorrectView(context, wordToTranslate, correctTranslation, comment, grammarRule);
          }
        }, orElse: () {
          return Text("Unknown state");
        });
      }),
    ));
  }

  Widget loadingView() {
    return Text("Loading...");
  }

  /// Return the word view that contains, the word info (which word to translate
  ///  and in which language), the text field and the validation button.
  Widget buildWordView(BuildContext context, String wordToTranslate, String? comment) {
    return Column(
      children: [
        buildWordInfo(context, wordToTranslate, comment),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: CupertinoTextField(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Color(0xFF3F3F3F), width: 0.6),
              borderRadius: BorderRadius.circular(10),
            ), // OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), borderRadius: 10)
            placeholder: "Translation",
            placeholderStyle: TextStyle(color: Color(0xFF3F3F3F)),
            style: TextStyle(color: Colors.white),
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            onChanged: (String word) {
              wordInputed = word;
            },
          ),
        ),
        GradientButton(
          onPressed: () {
            final cubit = context.read<TrainingCubit>();
            cubit.userInputedWord(wordInputed);
          },
          text: "Validate",
        ),
      ],
    );
  }

  /// Return the word info column, consists of which word to translate, and in which language.
  Widget buildWordInfo(BuildContext context, String wordToTranslate, [String? comment]) {
    return Column(
      children: [
        Row(
          children: [Spacer()],
        ),
        Text(
          "Translate to $translateToLanguage the word : ",
          style: TextStyle(color: Color(0xFFB1B1B1), fontSize: 15),
        ),
        Text(
          wordToTranslate.capitalizeFirstofEach,
          style: TextStyle(fontSize: 30),
        ),
        if (comment != null) Text("Note : $comment")
      ],
    );
  }

  Widget buildCorrectView(BuildContext context, String wordToTranslate, String? comment, String? grammarRule) {
    return Column(children: [
      buildWordInfo(context, wordToTranslate),
      SizedBox(height: 500, child: Correct(grammarRule)),
    ]);
  }

  Widget buildIncorrectView(
      BuildContext context, String wordToTranslate, String correctWord, String? comment, String? grammarRule) {
    return Column(children: [
      Text("e"),
      buildWordInfo(context, wordToTranslate),
      SizedBox(height: 500, child: Incorrect(correctWord, grammarRule))
    ]);
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

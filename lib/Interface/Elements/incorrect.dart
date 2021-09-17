import 'package:flutter/material.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:provider/provider.dart';
import 'button/gradient_button.dart';

class Incorrect extends StatelessWidget {
  final String correctWord;
  final String? grammarRule;
  final void Function() nextButtonPressed;

  Incorrect(this.correctWord, this.grammarRule, this.nextButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [Spacer()],
          ),
          Text(
            "Incorrect...",
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          Icon(
            Icons.close,
            color: Colors.red,
            size: 80,
          ),
          Text(
            "The correct answer was:",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            correctWord,
            style: TextStyle(fontSize: 35),
            textAlign: TextAlign.center,
          ),
          GradientButton(
            onPressed: () {
              this.nextButtonPressed();
            },
            text: "Next",
          ),
        ],
      ),
    );
  }
}

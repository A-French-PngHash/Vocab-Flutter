import 'package:flutter/material.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:provider/provider.dart';

import 'button/gradient_button.dart';

class Correct extends StatelessWidget {

  Correct();

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
            "Correct !",
            style: TextStyle(color: Colors.green, fontSize: 40),
          ),
          Icon(
            Icons.done_rounded,
            color: Colors.green,
            size: 150,
          ),
          GradientButton(
            onPressed: () {
            },
            text: "Next",
          )
        ],
      ),
    );
  }
}

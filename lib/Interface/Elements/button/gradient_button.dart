import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;
  bool enabled;
  GradientButtonColor color;
  late Gradient gradient;

  GradientButton({required this.text, this.onPressed, this.enabled = true, this.color = GradientButtonColor.orange}) {
    if (color == GradientButtonColor.orange) {
      gradient = LinearGradient(colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)]);
    } else if (color == GradientButtonColor.blue) {
      gradient = LinearGradient(colors: [Color(0xFF2E3192), Color(0xFF3FB9FF)]);
    } else {
      gradient = LinearGradient(colors: [Colors.red]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CupertinoButton(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (this.enabled && this.onPressed != null) {
              onPressed!();
            }
          },
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}

enum GradientButtonColor { orange, blue }

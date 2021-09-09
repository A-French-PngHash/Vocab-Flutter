import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;
  bool enabled;

  GradientButton({required this.text, this.onPressed, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 50,
          width: 100,
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
      ),
    );
  }
}

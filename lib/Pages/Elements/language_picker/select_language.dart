import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocab/Data/Model/language.dart';

/// Page that displays a list of available languages.
///
/// Pops as soon as the user selects a language/hits the back button.
class SelectLanguage extends StatelessWidget {
  Language currentlySelected;
  SelectLanguage(this.currentlySelected);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Chose a language"),
          previousPageTitle: "Menu",
          backgroundColor: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var language in Language.values)
              Form(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(language);
                  },
                  child: Row(
                    children: [
                      Text(representationFor(language), style: TextStyle(color: Colors.white),),
                      Spacer(),
                      if (currentlySelected == language) Icon(Icons.check),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

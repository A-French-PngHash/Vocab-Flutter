import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Page that displays a list of available languages.
///
/// Pops as soon as the user selects a language/hits the back button.
class SelectFromData extends StatelessWidget {
  List<String> data;
  List<String> currentlySelected;
  final String Function(String) format;
  final int minElements;
  final int maxElements;

  SelectFromData(this.data, this.currentlySelected, this.format, this.minElements, this.maxElements);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: "Menu",
          backgroundColor: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var data_element in data)
              Form(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(data_element);
                  },
                  child: Row(
                    children: [
                      Text(
                        format(data_element),
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      if (currentlySelected.contains(data_element)) Icon(Icons.check),
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

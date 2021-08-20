import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocab/Data/Model/language.dart';
import 'package:vocab/Data/Model/picker_enum_asbtract.dart';

/// Page that displays a list of available languages.
///
/// Pops as soon as the user selects a language/hits the back button.
class SelectFromData extends StatelessWidget {
  PickerData data;

  SelectFromData(this.data);

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
            for (var data_element in data.values)
              Form(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(data_element);
                  },
                  child: Row(
                    children: [
                      Text(data.nameFor(data_element), style: TextStyle(color: Colors.white),),
                      Spacer(),
                      if (data.currentlySelected == data_element) Icon(Icons.check),
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

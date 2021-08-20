import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Model/picker_enum_asbtract.dart';

class User extends PickerData {
  @override
  String currentlySelected;

  final List<String> values = ["tymeo", "titouan"];
  User(this.currentlySelected);

  @override
  String nameFor(String value) {
    switch (value) {
      case "titouan":
        return "Titouan";
      case "tymeo":
        return "Tyméo";
      default:
        return "Unknown user";
    }
  }
}

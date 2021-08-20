import 'picker_enum_asbtract.dart';

class Language extends PickerData {
  
  @override
  String currentlySelected;
  final List<String> values = ["french", "english", "spanish"];

  Language(this.currentlySelected);

  @override
  String nameFor(String value) {
    if (value == "french") {

        return "French 🇫🇷";
    } else if (value == "english") {
        return "English 🇬🇧"; 
    } else if (value == "spanish") {

        return "Spanish 🇪🇸";
    } else {
      return "Unknown Language";
    }
  }
}
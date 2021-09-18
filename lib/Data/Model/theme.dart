import 'package:vocab/Data/Model/words.dart';
import 'package:vocab/Services/capextension_string.dart';

class ThemeModel {
  String name;
  List<Words> words;

  ThemeModel(this.name, this.words);

  static String formatListToString(List<String> name_list) {
    String output;
    if (name_list.length > 1) {
      output = ThemeModel.formatUnique(name_list[0]) + " +" + (name_list.length - 1).toString() + " more...";
    } else {
      output = ThemeModel.formatUnique(name_list[0]);
    }
    return output;
  }

  static String formatUnique(String name) {
    return name.capitalize();
  }
}

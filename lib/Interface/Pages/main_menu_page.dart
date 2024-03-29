import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/main_menu_cubit/main_menu_cubit.dart';
import 'package:vocab/Cubits/picker_cubit/picker_cubit.dart';
import 'package:vocab/Cubits/session_recap/session_recap_cubit.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:vocab/Cubits/word_list/word_list_cubit.dart';
import 'package:vocab/Data/Model/ThemeModel.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:vocab/Interface/Elements/button/gradient_button.dart';
import 'package:vocab/Interface/Elements/button/gradient_button.dart';
import 'package:vocab/Interface/Elements/custom_text_field.dart';
import 'package:vocab/Interface/Pages/session_recap.dart';
import 'package:vocab/Interface/Pages/training_page.dart';
import 'package:vocab/Interface/Pages/word_list.dart';
import 'package:vocab/Services/format_strings.dart';
import '../Elements/language_picker/picker.dart';
import 'package:vocab/Services/capextension_string.dart';

class MainMenuPage extends StatelessWidget {
  /// List of the users of the app.
  final List<String> users = ["tymeo", "titouan", "demo"];

  /// List of all languages the user can pick from.
  final List<String> languageList = ["french", "english", "spanish"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: BlocBuilder<MainMenuCubit, MainMenuCubitState>(
          builder: (context, state) {
            return state.when(
              loading: buildLoadingView,
              menu: (List<String> themes, List<String> currentlySelectedTheme, String originLanguage,
                  String outputLanguage, String currentUser, int numberOfTranslationToDo, bool hasSessionToContinue) {
                return buildMainMenu(context, themes, currentlySelectedTheme, originLanguage, outputLanguage,
                    currentUser, numberOfTranslationToDo, hasSessionToContinue);
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildLoadingView() {
    return Container();
  }

  Widget buildMainMenu(
      BuildContext context,
      List<String> themes,
      List<String> currentlySelectedTheme,
      String originLanguage,
      String outputLanguage,
      String currentUser,
      int numberOfTranslationToDo,
      bool hasSessionToContinue) {
    print(currentlySelectedTheme);
    if (currentlySelectedTheme.length == 0) {
      // If there is no themes currently selected
      currentlySelectedTheme = [themes[0]]; // Set the currently selected themes to the first element of themes.
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Vocab",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          buildPreferencesForm(
              context: context,
              originLanguage: originLanguage,
              outputLanguage: outputLanguage,
              currentUser: currentUser,
              themes: themes,
              currentlySelectedThemes: currentlySelectedTheme,
              numberOfTranslationToDo: numberOfTranslationToDo),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              pushWordList(context);
            },
            child: Text("View word list"),
          ),
          ElevatedButton(
            onPressed: () {
              pushTrainingView(context, numberOfTranslationToDo);
            },
            child: Text("Start"),
          ),
          Text("By Titouan Blossier"),
        ],
      ),
    );
  }

  /// Build the preferences form which lets the user choose the following things :
  /// - The original language (the language words are shown to the user).
  /// - The translation language (the language in which the user has to
  /// translate the words).
  /// - The current user.
  /// - The themes to work on.
  /// - The number of words to translate in the next series.
  Widget buildPreferencesForm({
    required BuildContext context,
    required String originLanguage,
    required String outputLanguage,
    required String currentUser,
    required List<String> themes,
    required List<String> currentlySelectedThemes,
    required int numberOfTranslationToDo,
  }) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Picker(
            onSelect: (pickerCubit) {
              final cubit = context.read<MainMenuCubit>();
              cubit.originLanguageSelected(pickerCubit.currentlySelected[0]);
            },
            elements: languageList,
            currentlySelected: [originLanguage],
            format: language_name_for,
            description: "Original Language",
            minElements: 1,
            maxElements: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Color(0xFF2D2D2F),
              height: 1,
              thickness: 1,
            ),
          ),
          Picker(
            onSelect: (pickerCubit) {
              final cubit = context.read<MainMenuCubit>();
              cubit.outputLanguageSelected(pickerCubit.currentlySelected[0]);
            },
            elements: languageList,
            currentlySelected: [outputLanguage],
            format: language_name_for,
            description: "Translation Language",
            minElements: 1,
            maxElements: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Color(0xFF2D2D2F),
              height: 1,
              thickness: 1,
            ),
          ),
          Picker(
              elements: users,
              currentlySelected: [currentUser],
              format: user_name_for,
              description: "Current User",
              minElements: 1,
              maxElements: 1,
              onSelect: (PickerCubit pCubit) {
                final cubit = context.read<MainMenuCubit>();
                final String user = pCubit.currentlySelected[0];
                cubit.currentUserSelected(user);
              }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Color(0xFF2D2D2F),
              height: 1,
              thickness: 1,
            ),
          ),
          Picker(
            onSelect: (pickerCubit) {
              final cubit = context.read<MainMenuCubit>();
              cubit.themesSelected(pickerCubit.currentlySelected);
            },
            elements: themes,
            currentlySelected: currentlySelectedThemes,
            format: (e) => e.capitalize(),
            description: "Themes",
            minElements: 1,
            maxElements: themes.length,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Color(0xFF2D2D2F),
              height: 1,
              thickness: 1,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Session length",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Spacer(),
              SizedBox(
                child: TextField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  readOnly: currentUser == "tymeo",
                  controller: TextEditingController(text: numberOfTranslationToDo.toString()),
                  onSubmitted: (String value) {
                    print("submitted");
                    final valueInt = int.tryParse(value);
                    if (valueInt != null) {
                      final cubit = context.read<MainMenuCubit>();
                      cubit.numberOfTranslationTodoChanged(valueInt);
                      print("Number of translation to do changed, new value : $valueInt");
                    }
                  },
                ),
                width: 75,
              ),
            ],
          )
        ],
      ),
    );
  }

  /// Push the training view where the user will be asked words to translate.
  void pushTrainingView(BuildContext context, int numberOfTranslationToDo) {
    final cubit = context.read<MainMenuCubit>();

    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
      return BlocProvider(
        create: (context) => TrainingCubit(WordRepo(cubit.currentUser), cubit.originLanguage, cubit.outputLanguage,
            numberOfTranslationToDo, cubit.chosenThemes, cubit.currentUser),
        child: TrainingPage(language_name_for(cubit.outputLanguage), numberOfTranslationToDo, cubit.currentUser,
            ThemeModel.formatListToString(cubit.chosenThemes)),
      );
    }));
  }

  void pushWordList(BuildContext context) {
    final cubit = context.read<MainMenuCubit>();
    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
      return BlocProvider(
        create: (context) => WordListCubit(cubit.chosenThemes, WordRepo(cubit.currentUser)),
        child: WordList(cubit.originLanguage, cubit.outputLanguage),
      );
    }));
  }
}

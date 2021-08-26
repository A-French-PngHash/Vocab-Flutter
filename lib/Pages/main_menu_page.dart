import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/main_menu_cubit/main_menu_cubit.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:vocab/Pages/Elements/button/gradient_button.dart';
import 'package:vocab/Pages/training_page.dart';
import 'package:vocab/Services/format_strings.dart';
import 'Elements/language_picker/picker.dart';

class MainMenuPage extends StatelessWidget {
  int nbTranslationToDo = 65;
  final List<String> users = ["tymeo", "titouan"];
  final List<String> languageList = ["french", "english", "spanish"];
  String userSelected = "tymeo";
  final List<String> themesChosen = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        child: BlocBuilder<MainMenuCubit, MainMenuCubitState>(builder: (context, state) {
          return state.when(
            loading: buildLoadingView,
            menu: (String originLanguage, String outputLanguage, String currentUser, List<String> themes) {
              return buildMainMenu(context, originLanguage, outputLanguage, currentUser, themes);
            },
          );
        }),
      ),
    );
  }

  Widget buildLoadingView() {
    return Container();
  }

  Widget buildMainMenu(
      BuildContext context, String originLanguage, String outputLanguage, String currentUser, List<String> themes, String currentlySelectedTheme) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                "Vocab",
                style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            children: [
              Picker(
                text: "Original Language",
                elements: languageList,
                currentlySelected: originLanguage,
                onSelect: (String language) {
                  selectedLanguage(context, language, original: true);
                },
                format_func: language_name_for,
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
                text: "Translation Language",
                elements: languageList,
                currentlySelected: outputLanguage,
                onSelect: (String language) {
                  selectedLanguage(context, language, translation: true);
                },
                format_func: language_name_for,
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
                text: "Current user",
                elements: users,
                currentlySelected: currentUser,
                onSelect: (String user) {
                  final cubit = context.read<MainMenuCubit>();
                  cubit.currentUserSelected(user);
                },
                format_func: user_name_for,
              ),
              Picker(text: "Themes", elements: [], currentlySelected: currentlySelectedTheme, onSelect: (String theme_selected) {

              })
            ],
          ),
        ),
        Spacer(),
        GradientButton(
            text: "Start",
            onPressed: () {
              pushTrainingView(context);
            }),
        Text("By Titouan Blossier")
      ],
    );
  }

  /// Register the user selecting a language.
  ///
  /// Original/translation is how the language he selected is going to be used
  /// (there is two language pickers). Either translation or original must be
  /// equal to true.
  void selectedLanguage(BuildContext context, String language, {bool original = false, bool translation = false}) {
    assert(original || translation);
    final cubit = context.read<MainMenuCubit>();
    if (original) {
      cubit.originLanguageSelected(language);
    } else if (translation) {
      cubit.outputLanguageSelected(language);
    }
  }

  /// Push the training view where the user will be asked words to translate.
  void pushTrainingView(BuildContext context) {
    final cubit = context.read<MainMenuCubit>();

    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
      return BlocProvider(
        create: (context) => TrainingCubit(
            WordRepo(cubit.currentUser), cubit.originLanguage, cubit.outputLanguage, nbTranslationToDo, themesChosen),
        child: TrainingPage(language_name_for(cubit.outputLanguage), nbTranslationToDo),
      );
    }));
  }
}

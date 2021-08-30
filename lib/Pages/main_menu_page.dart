import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/main_menu_cubit/main_menu_cubit.dart';
import 'package:vocab/Cubits/picker_cubit/picker_cubit.dart';
import 'package:vocab/Cubits/training_cubit/cubit/training_cubit.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:vocab/Pages/Elements/button/gradient_button.dart';
import 'package:vocab/Pages/training_page.dart';
import 'package:vocab/Services/format_strings.dart';
import 'Elements/language_picker/picker.dart';

class MainMenuPage extends StatelessWidget {
  /// The number of translation the user will do in a series.
  final int nbTranslationToDo = 65;

  /// List of the users of the app.
  final List<String> users = ["tymeo", "titouan"];

  /// List of all languages the user can pick from.
  final List<String> languageList = ["french", "english", "spanish"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        child: BlocBuilder<MainMenuCubit, MainMenuCubitState>(
          builder: (context, state) {
            print("builder : $state");
            return state.when(
              loading: buildLoadingView,
              menu: (List<String> themes, List<String> currentlySelectedTheme, String originLanguage,
                  String outputLanguage, String currentUser) {
                return buildMainMenu(
                    context, themes, currentlySelectedTheme, originLanguage, outputLanguage, currentUser);
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

  Widget buildMainMenu(BuildContext context, List<String> themes, List<String> currentlySelectedTheme,
      String originLanguage, String outputLanguage, String currentUser) {

    print(currentlySelectedTheme);
    if (currentlySelectedTheme.length == 0) {
      // If there is no themes currently selected
      currentlySelectedTheme = [themes[0]]; // Set the currently selected themes to the first element of themes.
    }
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
                onSelect: (picker_cubit) {
                  final cubit = context.read<MainMenuCubit>();
                  cubit.originLanguageSelected(picker_cubit.currentlySelected[0]);
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
                onSelect: (picker_cubit) {
                  final cubit = context.read<MainMenuCubit>();
                  cubit.outputLanguageSelected(picker_cubit.currentlySelected[0]);
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
                onSelect: (picker_cubit) {
                  final cubit = context.read<MainMenuCubit>();
                  cubit.themesSelected(picker_cubit.currentlySelected);
                },
                elements: themes,
                currentlySelected: currentlySelectedTheme,
                format: (e) => e.capitalize(),
                description: "Themes",
                minElements: 1,
                maxElements: themes.length,
              )
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

  /// Push the training view where the user will be asked words to translate.
  void pushTrainingView(BuildContext context) {
    final cubit = context.read<MainMenuCubit>();

    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
      return BlocProvider(
        create: (context) => TrainingCubit(WordRepo(cubit.currentUser), cubit.originLanguage, cubit.outputLanguage,
            nbTranslationToDo, cubit.themesChosen),
        child: TrainingPage(language_name_for(cubit.outputLanguage), nbTranslationToDo),
      );
    }));
  }
}

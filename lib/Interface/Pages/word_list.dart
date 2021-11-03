import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:vocab/Cubits/word_list/word_list_cubit.dart';
import 'package:vocab/Data/Model/ThemeModel.dart';
import 'package:vocab/Data/Model/words.dart';

class WordList extends StatelessWidget {
  String originLanguage;
  String outputLanguage;

  WordList(this.originLanguage, this.outputLanguage) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Word List"),
            backgroundColor: Colors.black,
          ),
          child: BlocBuilder<WordListCubit, WordListState>(builder: (context, state) {
            return state.when(initial: () {
              return Container();
            }, loaded: (List<ThemeModel> themes) {
              return buildLoadedPage(context, themes);
            });
          })),
    );
  }

  Widget buildLoadedPage(BuildContext context, List<ThemeModel> themes) {
    return Container(
      child: Column(children: [
        Text(
          "Word List",
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          "Here you can view all the words (and their translations) that may be asked for you to translate.",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Expanded(child: buildWordList(context, themes)),
      ]),
    );
  }

  Widget buildWordList(BuildContext context, List<ThemeModel> themes) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        for (ThemeModel theme in themes)
          for (Words word in theme.words)
            DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyText2!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (originLanguage == "english")
                    Text(word.english)
                  else if (originLanguage == "spanish")
                    Text(word.spanish)
                  else if (originLanguage == "french")
                    Text(word.french),
                  Center(
                    child: Icon(Icons.east, color: Colors.white),
                  ),
                  if (outputLanguage == "english")
                    Text(word.english)
                  else if (outputLanguage == "spanish")
                    Text(word.spanish)
                  else if (outputLanguage == "french")
                    Text(word.french),
                ],
              ),
            ),
      ],
    );
  }
}

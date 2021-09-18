import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/main_menu_cubit/main_menu_cubit.dart';
import 'package:vocab/themes.dart';

import 'Interface/Pages/main_menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocab',
      theme: Themes().theme1,
      home: BlocProvider(
        create: (context) => MainMenuCubit(),
        child: MainMenuPage(),
      ),
    );
  }
}

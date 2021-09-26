import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocab/Cubits/picker_cubit/picker_cubit.dart';

/// Page that displays a list of available languages.
///
/// Pops as soon as the user selects a language/hits the back button.
class SelectFromData extends StatelessWidget {
  SelectFromData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.black,
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: "Menu",
            onPressed: () {
              final cubit = context.read<PickerCubit>();
              cubit.popView();
              if (cubit.isPresented == false) {
                Navigator.of(context).pop(cubit.currentlySelected);
              }
            },
          ),
        ),
        child: BlocConsumer<PickerCubit, PickerState>(
          builder: (context, state) {
            print(state);
            return state.maybeWhen(presented: (elements, currentlySelected) {
              return buildSelectView(context, elements, currentlySelected);
            }, orElse: () {
              return Text("Unknown state");
            });
          },
          listener: (context, state) {
            final cubit = context.read<PickerCubit>();
            if (cubit.isPresented == false) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }

  Widget buildSelectView(BuildContext context, List<String> elements, List<String> currentlySelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var dataElement in elements)
          Form(
            child: TextButton(
              onPressed: () {
                final cubit = context.read<PickerCubit>();
                cubit.userTappedOnElementRow(dataElement);
              },
              child: Row(
                children: [
                  Text(
                    dataElement,
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  if (currentlySelected.contains(dataElement)) Icon(Icons.check),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

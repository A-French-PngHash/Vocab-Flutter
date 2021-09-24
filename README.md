# Vocab

📖 Vocabulary application to help you learn new words in foreign languages.

## Quickstart

1. Fetch packages with `flutter pub get`
2. Generate files with `flutter pub run build_runner watch --delete-conflicting-outputs`
3. Run it !

## Getting Started

### Config users

To add/remove users, edit the `lib/Data/Model/user.dart` file. Defaults are defined in `lib/Cubits/main_menu_cubit/main_menu_cubit.dart`.

### Setup Words
The words to use are configured in `assets/*.json`. Set the name of the json file as the name of the user.


## How does it works ?

The app works by series of word. During each serie, random words are sent to the user for him to translate. As the user translate, words come more/less often, if he got them wrong/right.
At the end of the serie you have a recap that tells you how much words you got right, and how much you got wrong.
In `demo.json`, 3 languages are setup (french, english and spanish) but it's entirely up to you to add languages.

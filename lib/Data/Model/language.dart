enum Language {
  french, 
  english,
  spanish

}

String representationFor(Language language) {
  if (language == Language.english) {
    return "English 🇬🇧";
  } else if (language == Language.french) {
    return "French 🇫🇷";
  } else if (language == Language.spanish) {
    return "Spanish 🇪🇸";
  } else {
    return "Unknown Language";
  }
}
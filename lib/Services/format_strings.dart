/// This file helps with changing string to put them in a more presentable manner
/// to the user.
 

/// Returns the name of the language with its flag and capitalized.
String language_name_for(String value) {
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

/// Return the name for this user with the correct accents and capitalized.
String user_name_for(String value) {
    switch (value) {
      case "titouan":
        return "Titouan";
      case "tymeo":
        return "Tyméo";
      default:
        return "Unknown user";
    }
  }
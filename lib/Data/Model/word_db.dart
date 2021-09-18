class WordDb {
  int sessionId;
  String wordShown;
  String expectedTranslation;
  String inputedTranslaton;
  double scoreWhenShown;

  WordDb(
      {required this.sessionId,
      required this.wordShown,
      required this.expectedTranslation,
      required this.inputedTranslaton,
      required this.scoreWhenShown});

  static WordDb fromJson(Map<String, dynamic> json) {
    return WordDb(
      sessionId: json["sessionId"],
      wordShown: json["wordShown"],
      expectedTranslation: json["expectedTranslation"],
      inputedTranslaton: json["inputedTranslation"],
      scoreWhenShown: json["scoreWhenShown"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "sessionId" : this.sessionId,
      "wordShown": this.wordShown,
      "expectedTranslation": this.expectedTranslation,
      "inputedTranslation": this.inputedTranslaton,
      "scoreWhenShown": this.scoreWhenShown
    };
  }
}

class Session {
  int correct;
  int incorrect;
  DateTime beginDate;
  DateTime endDate;
  int wordCount;

  Session(
      {required this.correct,
      required this.incorrect,
      required this.wordCount,
      required this.beginDate,
      required this.endDate});

  static Session fromJson(Map json) {
    return Session(
      correct: json["correct"],
      incorrect: json["incorrect"],
      wordCount: json["wordCount"],
      beginDate: DateTime.parse(json["beginDate"]),
      endDate: DateTime.parse(json["endDate"]),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "beginDate": beginDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "correct": correct,
      "incorrect": incorrect,
      "wordCount": wordCount
    };
  }
}

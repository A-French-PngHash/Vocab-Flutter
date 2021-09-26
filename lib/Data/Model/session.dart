class Session {
  int? id; // The id is automatically generated by the database, therefore it
  // may have to be set after the creation of the object.
  int correct;
  int incorrect;
  DateTime beginDate;
  DateTime? endDate;
  int wordCount;

  Session(
      {required this.correct,
      required this.incorrect,
      required this.wordCount,
      required this.beginDate,
      this.endDate,
      this.id});

  /// Creates a session object from the json. You also need to specify the
  /// number of correct (and incorrect) words in this session.
  static Session fromJson(Map json, int correct, int incorrect) {
    return Session(
      id: json["id"],
      correct: correct,
      incorrect: incorrect,
      wordCount: json["wordCount"],
      beginDate: DateTime.parse(json["beginDate"]),
      endDate: json.containsKey("endDate") && json["endDate"] != null ? DateTime.parse(json["endDate"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "beginDate": beginDate.toIso8601String(),
      "endDate": endDate == null ? null : endDate!.toIso8601String(),
      "wordCount": wordCount
    };
  }
}

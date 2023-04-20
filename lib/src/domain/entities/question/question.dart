class Question {
  int? id;
  String? question;
  String? trueAnswer;
  List<String>? options;

  Question({
    this.id,
    this.question,
    this.trueAnswer,
    this.options,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        trueAnswer,
        options,
      ];

  @override
  bool get stringify => true;
}

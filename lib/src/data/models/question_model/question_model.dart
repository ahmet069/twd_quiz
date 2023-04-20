import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/question/question.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  final int? id;
  final String? question;
  @JsonKey(name: 'true_answer')
  final String? trueAnswer;
  final List<String>? options;

  const QuestionModel({
    this.id,
    this.question,
    this.trueAnswer,
    this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return _$QuestionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      question,
      options,
      trueAnswer,
    ];
  }

  Question toEntity() {
    return Question(
      id: id,
      question: question,
      options: options,
      trueAnswer: trueAnswer,
    );
  }
}

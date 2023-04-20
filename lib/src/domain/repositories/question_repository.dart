import '../entities/question/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getAllQuestions();
}

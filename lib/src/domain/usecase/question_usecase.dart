import '../entities/question/question.dart';
import '../repositories/question_repository.dart';

class QuestionUsecase {
  final QuestionRepository _repository;

  QuestionUsecase(this._repository);

  Future<List<Question>> getAllQuestions() async => _repository.getAllQuestions();
}

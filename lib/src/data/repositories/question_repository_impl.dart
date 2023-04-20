import '../../domain/entities/question/question.dart';
import '../../domain/repositories/question_repository.dart';
import '../datasources/local/question_datasource.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  final QuestionDataSource _questionDataSource;
  QuestionRepositoryImpl(this._questionDataSource);

  @override
  Future<List<Question>> getAllQuestions() async {
    try {
      final result = await _questionDataSource.getAllQuestions();
      return result.map((e) => e.toEntity()).toList();
    } catch (_) {
      rethrow;
    }
  }
}

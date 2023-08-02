import '../../dummy_data/question_data.dart';
import '../../models/question_model/question_model.dart';

abstract class  QuestionDataSource {
  Future<List<QuestionModel>> getAllQuestions();
}

class QuestionDataSourceImpl extends QuestionDataSource {
  @override
  Future<List<QuestionModel>> getAllQuestions() async {
    try {
      final data = QuestionData.getAllQuestions();
      final dataList = data.map((e) => QuestionModel.fromJson(e)).toList();
      return dataList;
    } on Exception catch (_) {
      rethrow;
    }
  }
}

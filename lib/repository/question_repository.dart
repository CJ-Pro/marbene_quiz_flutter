import 'package:get/get.dart';
import 'package:marbene/services/database_service.dart';
import '../model/question/question.dart';

class QuestionRepository {
  final _databaseService = Get.find<DatabaseService>();

  Future<Map<String, Question>> get getQuestions async {
    final multipleChoice = await _getMultipleChoice();
    final pictureTest = await _getPictureTest();
    final theory = await _getTheory();
    return {...multipleChoice, ...pictureTest, ...theory};
  }

  Future<Question> getQuestionById(int id) async {
    final questions = await getQuestions;
    return questions[id];
  }

  Future<Map<String, MultipleChoice>> _getMultipleChoice() async {
    final snapshot =
        await _databaseService.getSnapshot(_getPath('multipleChoice'));
    return Map.from(snapshot.value).map(
      (key, value) => MapEntry(
        key,
        MultipleChoice.fromMap(Map<String, dynamic>.from(value)),
      ),
    );
  }

  Future<Map<String, PictureTest>> _getPictureTest() async {
    final snapshot =
        await _databaseService.getSnapshot(_getPath('pictureTest'));
    return Map.from(snapshot.value).map(
      (key, value) => MapEntry(
        key,
        PictureTest.fromMap(Map<String, dynamic>.from(value)),
      ),
    );
  }

  Future<Map<String, Theory>> _getTheory() async {
    final snapshot = await _databaseService.getSnapshot(_getPath('theory'));
    return Map.from(snapshot.value).map(
      (key, value) => MapEntry(
        key,
        Theory.fromMap(Map<String, dynamic>.from(value)),
      ),
    );
  }

  String _getPath(String category) =>
      'flamelink/environments/production/content/$category/en-US/';
}

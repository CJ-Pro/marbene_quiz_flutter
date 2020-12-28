import 'package:get/get.dart';
import 'package:marbene/services/database_service.dart';
import '../model/question/question.dart';

class QuestionRepository {
  final _databaseService = Get.find<DatabaseService>();

  Future<Map<int, Question>> get getQuestions async {
    var multipleChoice = await _getMultipleChoice();
    var pictureTest = await _getPictureTest();
    var theory = await _getTheory();
    return {...multipleChoice, ...pictureTest, ...theory};
  }

  Future<Question> getQuestionById(int id) async {
    var questions = await getQuestions;
    return questions[id];
  }

  Future<Map<int, MultipleChoice>> _getMultipleChoice() async {
    var snapshot =
        await _databaseService.getSnapshot(_getPath("multipleChoice"));
    return Map.from(snapshot.value).map(
      (key, value) => MapEntry(
        key,
        MultipleChoice.fromMap(Map<String, dynamic>.from(value)),
      ),
    );
  }

  Future<Map<int, PictureTest>> _getPictureTest() async {
    var snapshot = await _databaseService.getSnapshot(_getPath("pictureTest"));
    return Map.from(snapshot.value).map(
      (key, value) => MapEntry(
        key,
        PictureTest.fromMap(Map<String, dynamic>.from(value)),
      ),
    );
  }

  Future<Map<int, Theory>> _getTheory() async {
    var snapshot = await _databaseService.getSnapshot(_getPath("theory"));
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

import 'package:get/get.dart';
import 'package:marbene/services/database_service.dart';
import '../model/question/question.dart';

class QuestionRepository {
  final _reference = Get.find<DatabaseService>().ref;

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
    var multipleChoiceRef = _reference.child(_getPath('multipleChoice'));
    multipleChoiceRef.keepSynced(true);
    var snapshot = await multipleChoiceRef.once();
    return Map.from(snapshot.value).map(
      (key, value) => MapEntry(
        key,
        MultipleChoice.fromMap(Map<String, dynamic>.from(value)),
      ),
    );
  }

  Future<Map<int, PictureTest>> _getPictureTest() async {
    var pictureTestRef = _reference.child(_getPath('pictureTest'));
    pictureTestRef.keepSynced(true);
    var snapshot = await pictureTestRef.once();
    return Map.from(snapshot.value).map(
      (key, value) => MapEntry(
        key,
        PictureTest.fromMap(Map<String, dynamic>.from(value)),
      ),
    );
  }

  Future<Map<int, Theory>> _getTheory() async {
    var theoryRef = _reference.child(_getPath('theory'));
    theoryRef.keepSynced(true);
    var snapshot = await theoryRef.once();
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

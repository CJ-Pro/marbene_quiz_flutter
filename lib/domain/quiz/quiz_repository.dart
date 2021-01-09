import 'package:get/get.dart';

import '../../model/question/question.dart';
import 'quiz_model.dart';
import '../../services/authentication_service.dart';
import '../../services/database_service.dart';

class QuizRepository {
  final _databaseService = Get.find<DatabaseService>();
  final _userId = Get.find<AuthenticationService>().user.uid;

  String get _quizPath => "flamelink/quiz/$_userId/";

  Future<Quiz> getOrCreateQuiz(List<Question> questions) async {
    var snapshot = await _databaseService.getSnapshot(_quizPath);
    if (snapshot.value.isNullOrBlank) {
      await _createQuiz(questions);
      snapshot = await _databaseService.getSnapshot(_quizPath);
    }
    return Quiz.fromMap(snapshot.value);
  }

  Future<void> _createQuiz(List<Question> questions) async {
    //TODO Key Timestamp with Quiz intial reference set
  }
}

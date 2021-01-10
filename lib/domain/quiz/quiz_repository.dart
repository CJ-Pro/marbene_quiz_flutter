import 'package:get/get.dart';

import '../../model/question/question.dart';
import '../../services/authentication_service.dart';
import '../../services/database_service.dart';
import 'quiz_model.dart';

class QuizRepository {
  final _databaseService = Get.find<DatabaseService>();
  final _userId = Get.find<AuthenticationService>().user.uid;

  String get _quizPath => 'flamelink/quiz/$_userId/';

  Future<void> createQuiz(List<Question> questions) async {
    final assesments = questions
        .map((question) => question.blankAssessment)
        .toList()
          ..shuffle(); // Shuufle assesments for variability
    final creationTimeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final quiz = Quiz(
      id: creationTimeStamp,
      assessments: assesments,
    );
    await _databaseService.setData(_quizPath, creationTimeStamp, quiz.toMap());
    return quiz;
  }

  Future<List<Quiz>> getPreviousQuiz() async {
    final snapshot = await _databaseService.getSnapshot(_quizPath);
    return Map<String, Map>.from(snapshot.value)
        .values
        .map((map) => Quiz.fromMap(Map<String, dynamic>.from(map)))
        .toList();
  }
}

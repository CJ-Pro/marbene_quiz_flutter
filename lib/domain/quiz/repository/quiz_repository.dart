import 'package:get/get.dart';

import '../../../services/authentication_service.dart';
import '../../../services/database_service.dart';
import '../../question/model/question.dart';
import '../model/quiz.dart';

class QuizRepository {
  final _databaseService = Get.find<DatabaseService>();
  final _userId = Get.find<AuthenticationService>().user.uid;

  String get _userQuizPath => 'flamelink/quiz/$_userId/';

  Future<void> createQuiz(List<Question> questions) async {
    final assesments = _createAssessments(questions)
      ..shuffle(); // Shuffle assesments for variability
    final creationTimeStamp = DateTime.now().millisecondsSinceEpoch;
    final quiz = Quiz(
      id: creationTimeStamp,
      assessments: assesments,
    );
    _databaseService.setData(
        _userQuizPath, creationTimeStamp.toString(), quiz.toMap());
  }

  Future<List<Quiz>> getAllPreviousQuiz() async {
    final snapshot = await _databaseService.getSnapshot(_userQuizPath);
    return Map<String, dynamic>.from(snapshot.value ?? {})
        ?.values
        ?.map((map) => Quiz.fromMap(Map<String, dynamic>.from(map)))
        ?.toList();
  }

  void setQuizIndex(int quizId, int index) {
    _databaseService.updateData('$_userQuizPath/$quizId/', {'index': index});
  }

  List<Assessment> _createAssessments(List<Question> questions) {
    return questions?.asMap()?.entries?.map(
      (entry) {
        final index = entry.key;
        final question = entry.value;
        //TODO Extract switch statement and fx
        switch (question.category) {
          case QuestionCategory.multipleChoice:
            break;
          case QuestionCategory.pictureTest:
            break;
          case QuestionCategory.theory:
            break;
        }
      },
    )?.toList();
  }
}

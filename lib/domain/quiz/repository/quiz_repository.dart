import 'dart:collection';

import 'package:get/get.dart';

import '../../../paths/firebase_database_paths.dart';
import '../../../services/database_service.dart';
import '../../question/model/question.dart';
import '../model/quiz.dart';

class QuizRepository {
  final _databaseService = Get.find<DatabaseService>();

  Future<Quiz> createQuiz(Set<Question> questions) async {
    final assesments = questions
        .map((question) => question.newAssessment)
        .toList()
          ..shuffle(); // Shuffle assesments for variability
    final creationTimeStamp = DateTime.now().millisecondsSinceEpoch;
    final quiz = Quiz(
      id: creationTimeStamp,
      assessments: UnmodifiableListView(assesments),
    );
    _databaseService.setData(FirebaseDatabasePath().userQuiz,
        creationTimeStamp.toString(), quiz.toMap());
    return Future.value(quiz);
  }

  Future<List<Quiz>> getAllPreviousQuiz() async {
    final snapshot =
        await _databaseService.getSnapshot(FirebaseDatabasePath().userQuiz);
    return Map<String, dynamic>.from(snapshot.value ?? {})
        ?.values
        ?.map((map) => Quiz.fromMap(Map<String, dynamic>.from(map)))
        ?.toList();
  }

  void setQuizIndex(int quizId, int index) {
    _databaseService.updateData(
        FirebaseDatabasePath().getUserQuizById(quizId), {'index': index});
  }
}

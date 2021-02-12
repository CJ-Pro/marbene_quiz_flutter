import 'package:get/get.dart';
import '../services/authentication_service.dart';

class FirebaseDatabasePath {
  final String _userId = Get.find<AuthenticationService>().user.uid;

  //Quiz
  String get userQuiz => 'quiz/$_userId/';
  String getUserQuizById(int quizId) => 'quiz/$_userId/$quizId/';

  //Answered
  String get userAnswers => 'answers/$_userId/';

  //Flagged
  String get userFlags => 'flags/$_userId/';
}

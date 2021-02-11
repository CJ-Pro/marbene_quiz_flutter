import 'package:get/get.dart';
import '../../../services/authentication_service.dart';

class FirebaseQuizPath {
  final String _userId = Get.find<AuthenticationService>().user.uid;

  String get userQuiz => 'quiz/$_userId/';
  String getUserQuizById(int quizId) => 'quiz/$_userId/$quizId/';
}

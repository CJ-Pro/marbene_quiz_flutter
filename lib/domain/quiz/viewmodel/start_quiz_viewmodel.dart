import 'package:get/get_state_manager/get_state_manager.dart';
import '../model/quiz.dart';

class QuizViewModel extends GetNotifier<Quiz> {
  QuizViewModel(Quiz quiz) : super(quiz);
}

import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../model/quiz.dart';

class QuizViewModel extends GetNotifier<Quiz> {
  QuizViewModel(Quiz quiz) : super(quiz);

  PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}

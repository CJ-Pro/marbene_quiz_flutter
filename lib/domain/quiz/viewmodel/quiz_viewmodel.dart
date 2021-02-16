import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../model/quiz.dart';
import '../repository/quiz_repository.dart';

class QuizViewModel extends GetNotifier<Quiz> {
  QuizViewModel(Quiz quiz) : super(quiz);

  final _quizRepository = Get.put(QuizRepository());
  PageController pageController;
  //Assessment id same as assessment page
  int currentAssessmentId;
  RxInt _currentPage;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController(initialPage: value.index ?? 0);
    currentAssessmentId = pageController.initialPage;
    _currentPage = currentAssessmentId.obs;
  }

  updatePageIndex(int index) {
    _currentPage(index);
    currentAssessmentId = index;
    _quizRepository.updateQuizIndex(value.id, index);
  }

  int get quizId => value.id;

  int get assessmentId => currentAssessmentId;

  int get currentPage => _currentPage.value + 1;

  int get totalPages => value.assessments.length;
}

import 'package:get/get.dart';

import '../model/quiz.dart';
import '../services/quiz_service.dart';

class PreviousQuizViewModel extends GetNotifier<List<Quiz>> {
  PreviousQuizViewModel() : super(<Quiz>[]);

  @override
  void onInit() {
    super.onInit();
    _loadPreviousQuiz();
  }

  Future<void> _loadPreviousQuiz() async {
    try {
      change(value, status: RxStatus.loading());
      final previousQuizData =
          await Get.put(QuizService()).getAllPreviousQuizSortedByTimestamp();
      change(previousQuizData, status: RxStatus.success());
    } catch (e) {
      change(value, status: RxStatus.error(e.toString()));
    }
  }

  void reload() {
    _loadPreviousQuiz();
  }
}

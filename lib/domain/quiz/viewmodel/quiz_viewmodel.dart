import 'package:get/get.dart';

import '../../../exceptions/app_exception.dart';
import '../../question/model/question.dart';
import '../../question/repository/question_repository.dart';
import '../../quiz/model/quiz.dart';
import '../services/quiz_service.dart';

class QuizViewModel extends GetxController {
  final _quizService = Get.put(QuizService());
  final _questionRepository = Get.put(QuestionRepository());
  Map<int, Question> _questions;
  final _isLoading = true.obs;

  @override
  void onInit() {
    _loadQuestions();
    super.onInit();
  }

  Future<void> _loadQuestions() async {
    _isLoading(true);
    try {
      //Unmodifiable map
      _questions = Map<int, Question>.unmodifiable(
          await _questionRepository.getQuestions);
    } catch (e) {
      Get.snackbar('Error', (e as AppException).message);
    } finally {
      _isLoading(false);
    }
  }

  Future<List<Quiz>> getPreviousQuiz() async {
    _isLoading(true);
    List<Quiz> previousQuiz;
    try {
      previousQuiz = await _quizService.getAllPreviousQuizSortedByTimestamp();
    } finally {
      _isLoading(false);
    }
    return previousQuiz ?? [];
  }

  Future<Quiz> getOneQuiz() async {
    _isLoading(true);
    Quiz quiz;
    try {
      quiz = (await _quizService.getAllPreviousQuizSortedByTimestamp()).first;
    } finally {
      _isLoading(false);
    }
    return quiz;
  }

  Map<int, Question> get questions => _questions;
  bool get isLoading => _isLoading.value;
}

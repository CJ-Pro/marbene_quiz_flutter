import 'package:get/get.dart';
import '../../domain/quiz/quiz_model.dart';
import '../../model/question/question.dart';
import '../../repository/question_repository.dart';
import 'quiz_service.dart';

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
      _questions = await _questionRepository.getQuestions;
      await _quizService.createQuiz(_questions.values.take(10).toList());
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

  Map<int, Question> get questions => _questions;
  bool get isLoading => _isLoading.value;
}

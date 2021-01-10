import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/quiz/quiz_model.dart';

import '../../exceptions/exceptions.dart';
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
    } on DatabaseException catch (e) {
      Get.snackbar(
        'Error connecting to Database',
        e.message,
        backgroundColor: Colors.red,
      );
    } finally {
      _isLoading(false);
    }
  }

  Future<List<Quiz>> getPreviousQuiz() async {
    _isLoading(true);
    try {
      final x = await _quizService.getPreviousQuizSortedByTimestamp();
      return x;
    } on DatabaseException catch (e) {
      Get.snackbar(
        'Error connecting to Database',
        e.message,
        backgroundColor: Colors.red,
      );
    } finally {
      _isLoading(false);
    }
    return [];
  }

  Map<int, Question> get questions => _questions;
  bool get isLoading => _isLoading.value;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    loadQuestions();
    super.onInit();
  }

  Future<void> loadQuestions() async {
    _isLoading(true);
    try {
      _questions = await _questionRepository.getQuestions;
      final _testQuestions = questions.values.take(10).toList();
      await _quizService.createQuiz(_testQuestions);
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

  Map<int, Question> get questions => _questions;
  bool get isLoading => _isLoading.value;
}

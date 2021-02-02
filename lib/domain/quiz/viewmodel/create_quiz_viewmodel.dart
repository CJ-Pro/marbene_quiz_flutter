import 'dart:collection';

import 'package:get/get.dart';
import '../../question/repository/question_repository.dart';

class CreateQuizViewModel extends GetNotifier<Set<Question>> {
  CreateQuizViewModel() : super(const <Question>{});

  @override
  void onInit() {
    super.onInit();
    _loadQuestions();
  }

  UnmodifiableListView<Question> _questions;
  final Map<String, List<String>> _questionData = {
    'categories': [],
    'subjects': [],
    'systems': [],
  };

  Map<String, List<String>> get questionData => _questionData;

  void _loadQuestions() async {
    try {
      change(value, status: RxStatus.loading());
      _questions = UnmodifiableListView<Question>(
          (await Get.put(QuestionRepository().getQuestions)).values);
      _loadQuestionData();
      change(_questions.toSet(), status: RxStatus.success());
    } catch (e) {
      change(value, status: RxStatus.error('$e'));
    }
  }

  void _loadQuestionData() {
    for (final question in _questions) {
      final category = question.category.value;
      final subject = question.subject;
      final system = question.system;
      //Add data in one loop for performance benefits.
      if (!_questionData['categories'].contains(category))
        _questionData['categories'].add(category);
      if (!_questionData['subjects'].contains(subject))
        _questionData['subjects'].add(subject);
      if (!_questionData['systems'].contains(system))
        _questionData['systems'].add(system);
    }
  }
}

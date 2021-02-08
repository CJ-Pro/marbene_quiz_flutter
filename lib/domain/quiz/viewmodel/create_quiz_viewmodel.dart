import 'dart:collection';

import 'package:get/get.dart';
import '../../question/repository/question_repository.dart';

enum Mode { all, incorrect, notAnswered, flagged }

class CreateQuizViewModel extends GetNotifier<Set<Question>> {
  QuestionCategory _category;
  String _subject;
  String _system;
  CreateQuizViewModel() : super(const <Question>{});

  @override
  void onInit() {
    super.onInit();
    _loadQuestions();
  }

  UnmodifiableListView<Question> _questions;

  void _loadQuestions() async {
    try {
      change(value, status: RxStatus.loading());
      _questions = UnmodifiableListView<Question>(
          (await Get.put(QuestionRepository().getQuestions)).values);
      change(_questions.toSet(), status: RxStatus.success());
    } catch (e) {
      change(value, status: RxStatus.error('$e'));
    }
  }

  bool isValidMode(Question question) {
    return true;
  }

  isValidSubject(Question question) => question.subject == _subject;

  isValidSystem(Question question) => question.system == _system;

  bool isValidCategory(Question question) => question.category == _category;

  void updateValidQuestions() {
    change(_questions
        .where(isValidMode)
        .where(isValidCategory)
        .where(isValidSubject)
        .where(isValidSystem)
        .toSet());
  }
}

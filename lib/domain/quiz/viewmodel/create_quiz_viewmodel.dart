import 'dart:collection';

import 'package:get/get.dart';
import '../../question/repository/question_repository.dart';

enum Mode { all, incorrect, notAnswered, flagged }

class CreateQuizViewModel extends GetNotifier<Set<Question>> {
  CreateQuizViewModel() : super(const <Question>{});

  @override
  void onInit() {
    super.onInit();
    _loadQuestions();
  }

  UnmodifiableListView<Question> _questions;

  final _hasTimer = false.obs;
  bool get hasTimer => _hasTimer.value;
  set hasTimer(value) => _hasTimer(value);

  final _hasTutor = true.obs;
  bool get hasTutor => _hasTutor.value;
  set hasTutor(value) => _hasTutor(value);

  final _maxNumberOfQuestions = 25.0.obs;
  double get maxNumberOfQuestions => _maxNumberOfQuestions.value;
  set maxNumberOfQuestions(value) => _maxNumberOfQuestions(value);

  Set<String> get categories =>
      _questions.map((question) => question.category.value).toSet();

  Set<String> get subjects =>
      _questions.map((question) => question.subject).toSet();

  Set<String> get systems =>
      _subjects.map((question) => question.system).toSet();

  QuestionCategory _category;
  set category(QuestionCategory category) {
    _category = category;
    updateValidQuestions();
  }

  String _subject;
  set subject(String subject) {
    _subject = subject;
    updateValidQuestions();
  }

  String _system;
  set system(String system) {
    _system = system;
    updateValidQuestions();
  }

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

  bool isValidCategory(Question question) {
    if (_category == null) return true;
    return question.category == _category;
  }

  bool isValidSubject(Question question) {
    if (_subject == null) return true;
    return question.subject == _subject;
  }

  bool isValidSystem(Question question) {
    if (_system == null) return true;
    return question.system == _system;
  }

  Iterable<Question> get _subjects => _questions
      .where(isValidMode)
      .where(isValidCategory)
      .where(isValidSubject);

  void updateValidQuestions() {
    change(
      _subjects.where(isValidSystem).toSet(),
    );
  }
}

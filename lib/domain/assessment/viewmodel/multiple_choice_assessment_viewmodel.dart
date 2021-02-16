import 'package:get/get.dart';

import '../../question/model/question.dart';
import '../../question/repository/question_repository.dart';
import '../../quiz/repository/quiz_repository.dart';
import '../../quiz/viewmodel/quiz_viewmodel.dart';
import '../model/assessment.dart';
import '../value/answer/answer.dart';

class MultipleChoiceAssessmentViewModel
    extends GetNotifier<MultipleChoiceAssessment> {
  MultipleChoiceAssessmentViewModel(MultipleChoiceAssessment assessment)
      : super(assessment);

  final _quizRepository = Get.find<QuizRepository>();
  final _quizViewModel = Get.find<QuizViewModel>();

  MultipleChoice _question;
  MultipleChoice get question => _question;

  List<String> choiceLabels = const ['A.', 'B.', 'C.', 'D.', 'E.'];

  @override
  void onInit() {
    super.onInit();
    _loadQuestion();
  }

  Future<void> _loadQuestion() async {
    try {
      change(value, status: RxStatus.loading());
      _question =
          await Get.put(QuestionRepository()).getQuestionById(value.questionId);
      change(value, status: RxStatus.success());
    } catch (e) {
      change(value, status: RxStatus.error('$e'));
    }
  }

  void updateChoice(int index) {
    change(value.copyWith(currentChoice: index));
    _quizRepository.updateAssessmentChoice(
        _quizViewModel.quizId, _quizViewModel.assessmentId, index);
  }

  void submit() {
    final answer = MultipleChoiceAnswer(value.questionId, value.currentChoice,
        value.currentChoice == _question.answer);
    change(value.copyWith(answer: answer));
    _quizRepository.setAssessmentAnswer(_quizViewModel.quizId,
        _quizViewModel.assessmentId, answer.questionId, answer.toMap());
  }
}

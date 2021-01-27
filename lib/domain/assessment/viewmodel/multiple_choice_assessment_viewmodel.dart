import 'package:get/get.dart';

import '../../question/model/question.dart';
import '../../question/repository/question_repository.dart';
import '../model/assessment.dart';
import '../value/answer/answer.dart';

class MultipleChoiceAssessmentViewModel
    extends GetNotifier<MultipleChoiceAssessment> {
  MultipleChoiceAssessmentViewModel(MultipleChoiceAssessment assessment)
      : super(assessment);

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
  }

  void submit() {
    change(
      value.copyWith(
        answer: MultipleChoiceAnswer(
          state.questionId,
          state.currentChoice,
          state.currentChoice == _question.answer,
        ),
      ),
    );
  }
}

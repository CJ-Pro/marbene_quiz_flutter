import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../question/model/question.dart';
import '../../viewmodels/multiple_choice_assessment_viewmodel.dart';
import '../assessment_widget.dart';
import '../explanation_block.dart';
import '../question_block.dart';
import '../submit_button.dart';
import 'choice_select.dart';

class MultipleChoiceAssessmentWidget extends AssessmentWidget {
  MultipleChoiceAssessmentWidget(
    MultipleChoiceAssessment assessment,
  ) : super(assessment);

  @override
  Widget render(bool isTutored) {
    final _viewmodel = Get.put(
      MultipleChoiceAssessmentViewModel(assessment),
      tag: assessment.questionId.toString(),
    );

    return Obx(
      () {
        if (_viewmodel.isLoading)
          return const Center(child: CircularProgressIndicator());

        final _question = _viewmodel.question;

        return _viewmodel.obx(
          (state) => ListView(
            children: [
              QuestionBlock(question: _question.question),
              _ChoiceList(
                choices: _question.choices,
                currentChoice: state.currentChoice,
                labels: _viewmodel.choiceLabels,
                onTap: _viewmodel.updateChoice,
                isSubmitted: state.isSubmitted,
                correctChoice: _question.answer,
              ),
              isTutored && !state.isSubmitted
                  ? SubmitButton(onPressed: _viewmodel.submit)
                  : const SizedBox.shrink(),
              state.isSubmitted
                  ? ExplanationBlock(explanation: _question.explanation)
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}

class _ChoiceList extends StatelessWidget {
  final List<String> labels;
  final List<String> choices;
  final void Function(int) onTap;
  final bool isSubmitted;
  final int currentChoice;
  final int correctChoice;
  const _ChoiceList({
    Key key,
    @required this.choices,
    @required this.labels,
    @required this.onTap,
    @required this.isSubmitted,
    @required this.currentChoice,
    @required this.correctChoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0; index < choices.length; index++)
          ChoiceSelect(
            label: labels[index],
            choice: choices[index],
            onTap: () => onTap(index),
            isSelected: currentChoice == index,
            isSubmitted: isSubmitted,
            isCorrect: correctChoice == index,
            index: index,
          )
      ],
    );
  }
}

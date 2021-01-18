import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marbene/domain/quiz/repository/quiz_repository.dart';

import '../../../assessment/model/assessment.dart';
import '../../../assessment/widgets/assessment_widget.dart';
import '../../model/quiz.dart';

class StartQuizPage extends StatelessWidget {
  final Quiz quiz;

  const StartQuizPage({Key key, @required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: PageController(
            initialPage: 0,
          ),
          itemCount: quiz.assessments.length,
          itemBuilder: (BuildContext context, int index) {
            final assessment = quiz.assessments[index];
            return Column(
              children: [
                Expanded(
                  child: assessmentWidget(assessment),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget assessmentWidget(Assessment assessment) {
    if (assessment is MultipleChoiceAssessment) {
      return MultipleChoiceAssessmentWidget(assessment).render(quiz.isTutored);
    } else if (assessment is TheoryAssessment) {
      return Container();
    } else {
      throw NullThrownError();
    }
  }
}

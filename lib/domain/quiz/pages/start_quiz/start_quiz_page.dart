import 'package:flutter/material.dart';
import '../../../assessment/model/assessment.dart';

import '../../model/quiz.dart';
import '../../../assessment/widgets/multiple_choice_assessment_widget.dart';

class StartQuizPage extends StatelessWidget {
  final Quiz quiz;

  const StartQuizPage({Key key, @required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: quiz.assessments.length,
          itemBuilder: (BuildContext context, int index) {
            final assessment = quiz.assessments[index];
            if (assessment is MultipleChoiceAssessment) {
              return MultipleChoiceAssessmentWidget(assessment).render(context);
            } else if (assessment is TheoryAssessment) {
              return Container();
            } else {
              //Assessment is null.
              throw NullThrownError();
            }
          },
        ),
      ),
    );
  }
}

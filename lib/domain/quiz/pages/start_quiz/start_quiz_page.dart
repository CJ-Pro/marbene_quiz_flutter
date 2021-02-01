import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assessment/model/assessment.dart';
import '../../../assessment/widgets/assessment_widget.dart';
import '../../model/quiz.dart';
import '../../viewmodel/start_quiz_viewmodel.dart';

class StartQuizPage extends StatelessWidget {
  final Quiz quiz;
  const StartQuizPage({Key key, this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.put(QuizViewModel(quiz));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _viewmodel.obx(
          (state) => PageView.builder(
            itemCount: state.assessments.length,
            controller: _viewmodel.pageController,
            itemBuilder: (_, index) {
              final assessment = state.assessments[index];

              return assessmentWidget(assessment);
            },
          ),
        ),
      ),
    );
  }

  Widget assessmentWidget(Assessment assessment) {
    if (assessment is MultipleChoiceAssessment) {
      return MultipleChoiceAssessmentWidget(assessment);
    } else if (assessment is TheoryAssessment) {
      return Container();
    } else {
      return Container();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assessment/model/assessment.dart';
import '../../../assessment/widgets/assessment_widget.dart';
import '../../model/quiz.dart';
import '../../viewmodel/quiz_viewmodel.dart';

class QuizPage extends StatelessWidget {
  final Quiz quiz;
  const QuizPage({Key key, this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.put(QuizViewModel(quiz));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _viewmodel.obx(
          (state) => Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.report_rounded),
                        onPressed: () {}),
                    Text(
                        'Question ${_viewmodel.currentPage} of ${_viewmodel.totalPages}'),
                    IconButton(
                        icon: const Icon(Icons.flag_rounded), onPressed: () {}),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: state.assessments.length,
                  controller: _viewmodel.pageController,
                  onPageChanged: _viewmodel.updatePageIndex,
                  itemBuilder: (_, index) {
                    final assessment = state.assessments[index];

                    return assessmentWidget(assessment);
                  },
                ),
              ),
            ],
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

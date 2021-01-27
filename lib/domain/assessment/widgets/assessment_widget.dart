import 'package:flutter/material.dart';
import '../../assessment/model/assessment.dart';

export '../../assessment/model/assessment.dart';
export 'multiple_choice_assessment_widget/multiple_choice_assessment_widget.dart';

abstract class AssessmentWidget extends StatelessWidget {
  final Assessment assessment;
  AssessmentWidget(this.assessment);

  Widget buildAssessment();
  Widget bottomBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: buildAssessment(),
        ),
        bottomBar(),
      ],
    );
  }
}

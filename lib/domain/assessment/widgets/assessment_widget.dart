import 'package:flutter/material.dart';
import '../../assessment/model/assessment.dart';

export '../../assessment/model/assessment.dart';
export 'multiple_choice_assessment_widget/multiple_choice_assessment_widget.dart';

abstract class AssessmentWidget {
  final Assessment assessment;
  AssessmentWidget(this.assessment);
  Widget render(bool isTutored);
}

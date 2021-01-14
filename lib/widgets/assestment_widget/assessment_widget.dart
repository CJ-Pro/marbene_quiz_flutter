import 'package:flutter/material.dart';
import '../../model/assessment/assessment.dart';

export '../../model/assessment/assessment.dart';

abstract class AssessmentWidget {
  Widget render(BuildContext context, Assessment assessment);
}

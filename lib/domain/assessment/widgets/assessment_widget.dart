import 'package:flutter/material.dart';
import '../../assessment/model/assessment.dart';

export '../../assessment/model/assessment.dart';

abstract class AssessmentWidget {
  Widget render(BuildContext context, Assessment assessment);
}

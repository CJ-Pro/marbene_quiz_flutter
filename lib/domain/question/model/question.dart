import 'package:meta/meta.dart';

import '../../assessment/model/assessment.dart';
import 'category_enum.dart';

export '../../assessment/model/assessment.dart';
export 'category_enum.dart';
export 'multiple_choice.dart';
export 'picture_test.dart';
export 'theory.dart';

@immutable
abstract class Question {
  Question({
    this.id,
    this.system,
    this.subject,
    this.name,
    this.year,
  });

  QuestionCategory get category;
  Assessment get newAssessment;
  final String system;
  final String subject;
  final int id;
  final String name;
  final int year;
}

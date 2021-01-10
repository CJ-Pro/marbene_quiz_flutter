import '../assessment/assessment.dart';
export '../assessment/assessment.dart';
export 'multiple_choice.dart';
export 'picture_test.dart';
export 'theory.dart';

enum QuestionCategory { multipleChoice, pictureTest, theory }

abstract class Question {
  Question({
    this.system,
    this.subject,
    this.id,
    this.name,
    this.year,
  });

  QuestionCategory get category;
  final String system;
  final String subject;
  final String id;
  final String name;
  final int year;

  Assessment get blankAssessment;
}

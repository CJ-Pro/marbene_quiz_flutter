import 'package:meta/meta.dart';

export '../assessment/assessment.dart';
export 'multiple_choice.dart';
export 'picture_test.dart';
export 'theory.dart';

enum QuestionCategory { multipleChoice, pictureTest, theory }

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
  final String system;
  final String subject;
  final int id;
  final String name;
  final int year;

  Map<String, dynamic> get blankAssessment => {'id': id};
}

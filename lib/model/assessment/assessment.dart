import 'package:meta/meta.dart';

import '../question/category_enum.dart';

export '../question/category_enum.dart';
export 'multiple_choice_assessment.dart';
export 'theory_assessment.dart';

@immutable
abstract class Assessment {
  ///Refereces the id of a question.
  final int questionId;

  ///The category of the question.
  final QuestionCategory category;

  ///The users given solution.
  dynamic get solution;

  ///The time given in seconds if assessment is timed.
  int get timeGivenInSeconds;

  ///Map representation of assessment
  Map<String, dynamic> toMap();

  ///A quiz assessment
  Assessment(this.questionId, this.category);
}

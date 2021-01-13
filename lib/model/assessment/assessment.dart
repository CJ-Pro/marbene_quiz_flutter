import 'package:meta/meta.dart';

import '../answer/answer.dart';
import '../question/category_enum.dart';

export '../answer/answer.dart';
export '../question/category_enum.dart';
export 'multiple_choice_assessment.dart';
export 'theory_assessment.dart';

@immutable
abstract class Assessment {
  ///Refereces the id of a question.
  final int questionId;

  ///The category of the question.
  final QuestionCategory category;

  ///The users answer.
  Answer get getUserAnswer;

  ///The time given in seconds if assessment is timed.
  int get timeGivenInSeconds;

  ///Map representation of assessment
  Map<String, dynamic> toMap();

  ///If the particular assessment has been answered.
  bool get isSubmitted => getUserAnswer != null;

  ///A quiz assessment
  Assessment(this.questionId, this.category);
}

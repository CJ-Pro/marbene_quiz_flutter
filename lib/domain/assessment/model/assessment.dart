import 'package:meta/meta.dart';

import '../../question/model/category_enum.dart';
import '../value/answer/answer.dart';

export '../../question/model/category_enum.dart';
export '../value/answer/answer.dart';
export 'multiple_choice_assessment.dart';
export 'theory_assessment.dart';

@immutable
abstract class Assessment {
  //TODO Finish ID index Creation
  //final int id;

  ///Refereces the id of a question.
  final int questionId;

  ///The category of the question.
  final QuestionCategory category;

  ///The users answer.
  final Answer answer;

  ///Map representation of assessment
  Map<String, dynamic> toMap();

  ///The time given in seconds if assessment is timed.
  int get timeGivenInSeconds;

  ///If the particular assessment has been answered.
  bool get isSubmitted => answer != null;

  ///A quiz assessment
  Assessment(this.questionId, this.category, this.answer);
}

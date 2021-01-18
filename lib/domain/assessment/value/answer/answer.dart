import 'package:meta/meta.dart';

export 'multiple_choice_answer.dart';
export 'theory_answer.dart';

@immutable
abstract class Answer {
  ///The id of the question.
  final int questionId;

  ///Map representation of answer.
  Map<String, dynamic> toMap();

  ///A users answer to an assessment.
  Answer(this.questionId);
}

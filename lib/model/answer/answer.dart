import 'package:meta/meta.dart';

export 'multiple_choice_answer.dart';
export 'theory_answer.dart';

@immutable
abstract class Answer {
  ///The id of the question.
  final int questionId;

  ///Users input answer depending on assessment type.
  final Object input;

  ///If the answer is correct.
  final bool isCorrect;

  ///A users answer to an assessment.
  Answer(this.questionId, this.input, this.isCorrect);
}

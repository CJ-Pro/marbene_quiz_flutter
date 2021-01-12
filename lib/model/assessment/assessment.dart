import 'package:meta/meta.dart';

export 'multiple_choice_assessment.dart';
export 'theory_assessment.dart';

@immutable
abstract class Assessment {
  final int questionId;
  dynamic get solution;
  Assessment(this.questionId);
}

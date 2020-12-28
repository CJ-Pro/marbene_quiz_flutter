export 'multiple_choice_assessment.dart';
export 'theory_assessment.dart';

abstract class Assessment {
  final int id;
  dynamic get solution;
  bool get flagged;
  bool get correct;
  Assessment(this.id);
}

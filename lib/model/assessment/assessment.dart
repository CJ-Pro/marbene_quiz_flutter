export 'multiple_choice_assessment.dart';
export 'theory_assessment.dart';

abstract class Assessment {
  final String id;
  dynamic get solution;
  bool get flagged;
  bool get correct;
  Map<String, dynamic> toMap();
  static fromMap(x) {}
  Assessment(this.id);
}

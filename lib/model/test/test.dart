export 'multiple_choice_test.dart';
export 'theory_test.dart';

abstract class Test {
  final int id;
  bool get hasFlagged;
  bool get hasTimed;
  bool get hasTutored;
  int get currentElapsedTimeInSeconds;
  dynamic get getAnswer;
  int get getTotalAnswered;
  int get getTotalCorrect;

  Test({this.id});
}

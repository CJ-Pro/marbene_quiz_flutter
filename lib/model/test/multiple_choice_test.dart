import 'dart:convert';
import 'test.dart';

class MultipleChoiceTest extends Test {
  int elapsedTimeInSeconds;
  bool isFlagged;
  bool isTimed;
  bool isTutored;
  int chosenAnswer;
  int totalAnswered;
  int totalCorrect;
  MultipleChoiceTest({
    id,
    this.elapsedTimeInSeconds,
    this.isFlagged,
    this.isTimed,
    this.isTutored,
    this.chosenAnswer,
    this.totalAnswered,
    this.totalCorrect,
  }) : super(id: id);

  MultipleChoiceTest copyWith({
    int elapsedTimeInSeconds,
    bool isFlagged,
    bool isTimed,
    bool isTutored,
    int id,
    int chosenAnswer,
    int totalAnswered,
    int totalCorrect,
  }) {
    return MultipleChoiceTest(
      elapsedTimeInSeconds: elapsedTimeInSeconds ?? this.elapsedTimeInSeconds,
      isFlagged: isFlagged ?? this.isFlagged,
      isTimed: isTimed ?? this.isTimed,
      isTutored: isTutored ?? this.isTutored,
      id: id ?? this.id,
      chosenAnswer: chosenAnswer ?? this.chosenAnswer,
      totalAnswered: totalAnswered ?? this.totalAnswered,
      totalCorrect: totalCorrect ?? this.totalCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'elapsedTimeInSeconds': elapsedTimeInSeconds,
      'isFlagged': isFlagged,
      'isTimed': isTimed,
      'isTutored': isTutored,
      'id': id,
      'chosenAnswer': chosenAnswer,
      'totalAnswered': totalAnswered,
      'totalCorrect': totalCorrect,
    };
  }

  factory MultipleChoiceTest.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MultipleChoiceTest(
      elapsedTimeInSeconds: map['elapsedTimeInSeconds'],
      isFlagged: map['isFlagged'],
      isTimed: map['isTimed'],
      isTutored: map['isTutored'],
      id: map['id'],
      chosenAnswer: map['chosenAnswer'],
      totalAnswered: map['totalAnswered'],
      totalCorrect: map['totalCorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoiceTest.fromJson(String source) =>
      MultipleChoiceTest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MultipleChoiceTest(elapsedTimeInSeconds: $elapsedTimeInSeconds, isFlagged: $isFlagged, isTimed: $isTimed, isTutored: $isTutored, id: $id, chosenAnswer: $chosenAnswer, totalAnswered: $totalAnswered, totalCorrect: $totalCorrect)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceTest &&
        o.elapsedTimeInSeconds == elapsedTimeInSeconds &&
        o.isFlagged == isFlagged &&
        o.isTimed == isTimed &&
        o.isTutored == isTutored &&
        o.id == id &&
        o.chosenAnswer == chosenAnswer &&
        o.totalAnswered == totalAnswered &&
        o.totalCorrect == totalCorrect;
  }

  @override
  int get hashCode {
    return elapsedTimeInSeconds.hashCode ^
        isFlagged.hashCode ^
        isTimed.hashCode ^
        isTutored.hashCode ^
        id.hashCode ^
        chosenAnswer.hashCode ^
        totalAnswered.hashCode ^
        totalCorrect.hashCode;
  }

  @override
  int get currentElapsedTimeInSeconds => currentElapsedTimeInSeconds;

  @override
  int get getAnswer => chosenAnswer;

  @override
  int get getTotalAnswered => totalAnswered;

  @override
  int get getTotalCorrect => totalCorrect;

  @override
  bool get hasFlagged => isFlagged;

  @override
  bool get hasTimed => hasTimed;

  @override
  bool get hasTutored => isTutored;
}

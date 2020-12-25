import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'question_reference.dart';

class Test {
  final int id;
  List<QuestionReference> questions;
  int currentQuestion;
  int correctTotal;
  int answeredTotal;
  Test({
    this.id,
    this.questions,
    this.currentQuestion,
    this.correctTotal,
    this.answeredTotal,
  });

  Test copyWith({
    int id,
    List<QuestionReference> questions,
    int currentQuestion,
    int correctTotal,
    int answeredTotal,
  }) {
    return Test(
      id: id ?? this.id,
      questions: questions ?? this.questions,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      correctTotal: correctTotal ?? this.correctTotal,
      answeredTotal: answeredTotal ?? this.answeredTotal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questions': questions?.map((x) => x?.toMap())?.toList(),
      'currentQuestion': currentQuestion,
      'correctTotal': correctTotal,
      'answeredTotal': answeredTotal,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Test(
      id: map['id'],
      questions: List<QuestionReference>.from(
          map['questions']?.map((x) => QuestionReference.fromMap(x))),
      currentQuestion: map['currentQuestion'],
      correctTotal: map['correctTotal'],
      answeredTotal: map['answeredTotal'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) => Test.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Test(id: $id, questions: $questions, currentQuestion: $currentQuestion, correctTotal: $correctTotal, answeredTotal: $answeredTotal)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Test &&
        o.id == id &&
        listEquals(o.questions, questions) &&
        o.currentQuestion == currentQuestion &&
        o.correctTotal == correctTotal &&
        o.answeredTotal == answeredTotal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        questions.hashCode ^
        currentQuestion.hashCode ^
        correctTotal.hashCode ^
        answeredTotal.hashCode;
  }
}

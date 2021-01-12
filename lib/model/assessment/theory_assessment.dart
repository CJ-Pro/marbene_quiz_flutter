import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'assessment.dart';

@immutable
class TheoryAssessment extends Assessment {
  final List<String> answers;
  TheoryAssessment({
    int questionId,
    QuestionCategory category,
    this.answers,
  }) : super(questionId, category);
  @override
  get solution => answers;

  TheoryAssessment copyWith({
    int questionId,
    QuestionCategory category,
    List<String> answers,
  }) {
    return TheoryAssessment(
      questionId: questionId ?? this.questionId,
      category: category ?? this.category,
      answers: answers ?? this.answers,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'category': category.value,
      'answers': answers,
    };
  }

  factory TheoryAssessment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TheoryAssessment(
      questionId: map['questionId'],
      category: (map['category'] as String).toQuestionCategory,
      answers: List<String>.from(map['answers']),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TheoryAssessment(questionId: $questionId)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TheoryAssessment && o.questionId == questionId;
  }

  @override
  int get hashCode => questionId.hashCode;

  @override
  int get timeGivenInSeconds => throw UnimplementedError();
}

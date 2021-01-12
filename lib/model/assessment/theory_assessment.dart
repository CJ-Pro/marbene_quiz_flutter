import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'assessment.dart';

@immutable
class TheoryAssessment extends Assessment {
  final List<String> answers;
  TheoryAssessment({
    int questionId,
    this.answers,
  }) : super(questionId);
  @override
  get solution => answers;

  TheoryAssessment copyWith({
    int questionId,
    List<String> answers,
  }) {
    return TheoryAssessment(
      questionId: questionId ?? this.questionId,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'answers': answers,
    };
  }

  factory TheoryAssessment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TheoryAssessment(
      questionId: map['questionId'],
      answers: List<String>.from(map['answers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TheoryAssessment.fromJson(String source) =>
      TheoryAssessment.fromMap(json.decode(source));

  @override
  String toString() => 'TheoryAssessment(questionId: $questionId)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TheoryAssessment && o.questionId == questionId;
  }

  @override
  int get hashCode => questionId.hashCode;
}

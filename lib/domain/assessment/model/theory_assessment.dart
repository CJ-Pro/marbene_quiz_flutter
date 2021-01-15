import 'dart:convert';

import 'package:meta/meta.dart';

import 'assessment.dart';

@immutable
class TheoryAssessment extends Assessment {
  TheoryAssessment({
    int questionId,
    QuestionCategory category,
    TheoryAnswer answer,
  }) : super(questionId, category, answer);

  TheoryAssessment copyWith({
    int questionId,
    QuestionCategory category,
    Answer answer,
  }) {
    return TheoryAssessment(
      questionId: questionId ?? this.questionId,
      category: category ?? this.category,
      answer: answer ?? this.answer,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'category': category?.value,
      'answer': answer?.toMap(),
    };
  }

  factory TheoryAssessment.fromMap(map) {
    if (map == null) return null;

    return TheoryAssessment(
      questionId: map['questionId'],
      category: (map['category'] as String).toQuestionCategory,
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'TheoryAssessment(questionId: $questionId, category: $category, answer: $answer)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TheoryAssessment &&
        o.questionId == questionId &&
        o.category == category &&
        o.answer == answer;
  }

  @override
  int get hashCode => questionId.hashCode ^ category.hashCode ^ answer.hashCode;

  @override
  int get timeGivenInSeconds => 30;
}

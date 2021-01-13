import 'dart:convert';

import 'package:meta/meta.dart';

import 'assessment.dart';

@immutable
class MultipleChoiceAssessment extends Assessment {
  final MultipleChoiceAnswer answer;
  MultipleChoiceAssessment({
    int questionId,
    QuestionCategory category,
    this.answer,
  }) : super(questionId, category);

  @override
  Answer get getUserAnswer => answer;

  MultipleChoiceAssessment copyWith({
    int questionId,
    QuestionCategory category,
    Answer answer,
  }) {
    return MultipleChoiceAssessment(
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

  factory MultipleChoiceAssessment.fromMap(map) {
    if (map == null) return null;

    return MultipleChoiceAssessment(
      questionId: map['questionId'],
      category: (map['category'] as String)?.toQuestionCategory,
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'MultipleChoiceAssessment(questionId: $questionId, category: $category, answer: $answer)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceAssessment &&
        o.questionId == questionId &&
        o.category == category &&
        o.answer == answer;
  }

  @override
  int get hashCode => questionId.hashCode ^ category.hashCode ^ answer.hashCode;

  @override
  int get timeGivenInSeconds => 30;
}

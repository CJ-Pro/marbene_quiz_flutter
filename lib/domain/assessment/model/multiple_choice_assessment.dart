import 'dart:convert';

import 'package:meta/meta.dart';

import 'assessment.dart';

@immutable
class MultipleChoiceAssessment extends Assessment {
  final int currentChoice;
  MultipleChoiceAssessment({
    int questionId,
    QuestionCategory category,
    MultipleChoiceAnswer answer,
    this.currentChoice,
  }) : super(questionId, category, answer);

  MultipleChoiceAssessment copyWith({
    int questionId,
    QuestionCategory category,
    Answer answer,
    int currentChoice,
  }) {
    return MultipleChoiceAssessment(
      questionId: questionId ?? this.questionId,
      category: category ?? this.category,
      answer: answer ?? this.answer,
      currentChoice: currentChoice ?? this.currentChoice,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'category': category?.value,
      'answer': answer?.toMap(),
      'currentChoice': currentChoice,
    };
  }

  factory MultipleChoiceAssessment.fromMap(map) {
    if (map == null) return null;

    return MultipleChoiceAssessment(
      questionId: map['questionId'],
      category: (map['category'] as String)?.toQuestionCategory,
      answer: map['answer'],
      currentChoice: map['currentChoice'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'MultipleChoiceAssessment(questionId: $questionId)';

  @override
  int get timeGivenInSeconds => 30;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceAssessment &&
        o.questionId == questionId &&
        o.category == category &&
        o.answer == answer &&
        o.currentChoice == currentChoice;
  }

  @override
  int get hashCode {
    return questionId.hashCode ^
        category.hashCode ^
        answer.hashCode ^
        currentChoice.hashCode;
  }
}

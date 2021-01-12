import 'dart:convert';

import 'package:meta/meta.dart';

import 'assessment.dart';

@immutable
class MultipleChoiceAssessment extends Assessment {
  final int answer;
  MultipleChoiceAssessment({
    int questionId,
    this.answer,
  }) : super(questionId);
  @override
  get solution => answer;

  MultipleChoiceAssessment copyWith({
    int answer,
    int questionId,
  }) {
    return MultipleChoiceAssessment(
      questionId: questionId ?? this.questionId,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'answer': answer,
    };
  }

  factory MultipleChoiceAssessment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MultipleChoiceAssessment(
      questionId: map['questionId'],
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoiceAssessment.fromJson(String source) =>
      MultipleChoiceAssessment.fromMap(json.decode(source));

  @override
  String toString() => 'MultipleChoiceAssessment(questionId: $questionId)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceAssessment && o.questionId == questionId;
  }

  @override
  int get hashCode => questionId.hashCode;
}

import 'dart:convert';

import 'package:meta/meta.dart';

import 'answer.dart';

@immutable
class MultipleChoiceAnswer extends Answer {
  final int selectedChoice;
  final bool isCorrect;
  MultipleChoiceAnswer(
    int questionId,
    this.selectedChoice,
    this.isCorrect,
  ) : super(questionId);

  MultipleChoiceAnswer copyWith({
    int questionId,
    int selectedChoice,
    bool isCorrect,
  }) {
    return MultipleChoiceAnswer(
      questionId ?? this.questionId,
      selectedChoice ?? this.selectedChoice,
      isCorrect ?? this.isCorrect,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'selectedChoice': selectedChoice,
      'isCorrect': isCorrect,
    };
  }

  factory MultipleChoiceAnswer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MultipleChoiceAnswer(
      map['questionId'],
      map['selectedChoice'],
      map['isCorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoiceAnswer.fromJson(String source) =>
      MultipleChoiceAnswer.fromMap(json.decode(source));

  @override
  String toString() =>
      'MultipleChoiceAnswer(questionId: $questionId, selectedChoice: $selectedChoice, isCorrect: $isCorrect)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceAnswer &&
        o.questionId == questionId &&
        o.selectedChoice == selectedChoice &&
        o.isCorrect == isCorrect;
  }

  @override
  int get hashCode =>
      questionId.hashCode ^ selectedChoice.hashCode ^ isCorrect.hashCode;
}

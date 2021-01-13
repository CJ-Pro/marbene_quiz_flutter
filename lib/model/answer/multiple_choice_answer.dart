import 'dart:convert';

import 'package:meta/meta.dart';

import 'answer.dart';

@immutable
class MultipleChoiceAnswer extends Answer {
  MultipleChoiceAnswer(
    int questionId,
    int input,
    bool isCorrect,
  ) : super(questionId, input, isCorrect);

  MultipleChoiceAnswer copyWith({
    int questionId,
    int input,
    bool isCorrect,
  }) {
    return MultipleChoiceAnswer(
      questionId ?? this.questionId,
      input ?? this.input,
      isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'input': input,
      'isCorrect': isCorrect,
    };
  }

  factory MultipleChoiceAnswer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MultipleChoiceAnswer(
      map['questionId'],
      map['input'],
      map['isCorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoiceAnswer.fromJson(String source) =>
      MultipleChoiceAnswer.fromMap(json.decode(source));

  @override
  String toString() =>
      'MultipleChoiceAnswer(questionId: $questionId, input: $input, isCorrect: $isCorrect)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceAnswer &&
        o.questionId == questionId &&
        o.input == input &&
        o.isCorrect == isCorrect;
  }

  @override
  int get hashCode => questionId.hashCode ^ input.hashCode ^ isCorrect.hashCode;
}

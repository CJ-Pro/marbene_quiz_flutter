import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'answer.dart';

@immutable
class TheoryAnswer extends Answer {
  TheoryAnswer(
    int questionId,
    List<String> input,
    bool isCorrect,
  ) : super(questionId, input, isCorrect);

  TheoryAnswer copyWith({
    int questionId,
    List<String> input,
    bool isCorrect,
  }) {
    return TheoryAnswer(
      questionId ?? this.questionId,
      input ?? this.input,
      isCorrect ?? this.isCorrect,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'input': input,
      'isCorrect': isCorrect,
    };
  }

  factory TheoryAnswer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TheoryAnswer(
      map['questionId'],
      List<String>.from(map['input']),
      map['isCorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TheoryAnswer.fromJson(String source) =>
      TheoryAnswer.fromMap(json.decode(source));

  @override
  String toString() =>
      'TheoryAnswer(questionId: $questionId, input: $input, isCorrect: $isCorrect)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TheoryAnswer &&
        o.questionId == questionId &&
        listEquals(o.input, input) &&
        o.isCorrect == isCorrect;
  }

  @override
  int get hashCode => questionId.hashCode ^ input.hashCode ^ isCorrect.hashCode;
}

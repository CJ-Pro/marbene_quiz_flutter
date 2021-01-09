import 'dart:convert';

import 'assessment.dart';

class MultipleChoiceAssessment extends Assessment {
  bool _isCorrect;
  bool _isFlagged;
  int _answer;
  MultipleChoiceAssessment({
    int id,
    bool isCorrect,
    bool isFlagged = false,
    int answer,
  })  : _isCorrect = isCorrect,
        _isFlagged = isFlagged,
        _answer = answer,
        super(id);
  @override
  bool get correct => _isCorrect;

  @override
  bool get flagged => _isFlagged;

  @override
  int get solution => _answer;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isCorrect': _isCorrect,
      'isFlagged': _isFlagged,
      'answer': _answer,
    };
  }

  factory MultipleChoiceAssessment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MultipleChoiceAssessment(
      id: map['id'],
      isCorrect: map['isCorrect'],
      isFlagged: map['isFlagged'],
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoiceAssessment.fromJson(String source) =>
      MultipleChoiceAssessment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MultipleChoiceAssessment(id: $id, isCorrect: $_isCorrect, isFlagged: $_isFlagged, answer: $_answer)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceAssessment &&
        o.id == id &&
        o._isCorrect == _isCorrect &&
        o._isFlagged == _isFlagged &&
        o._answer == _answer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        _isCorrect.hashCode ^
        _isFlagged.hashCode ^
        _answer.hashCode;
  }
}
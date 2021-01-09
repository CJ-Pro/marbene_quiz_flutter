import 'dart:convert';

import 'assessment.dart';

class TheoryAssessment extends Assessment {
  bool _isCorrect;
  bool _isFlagged;
  List<String> _answers;
  TheoryAssessment({
    int id,
    bool isCorrect,
    bool isFlagged = false,
    List<String> answers,
  })  : _isCorrect = isCorrect,
        _isFlagged = isFlagged,
        _answers = answers,
        super(id);
  @override
  bool get correct => _isCorrect;

  @override
  bool get flagged => _isFlagged;

  @override
  List<String> get solution => _answers;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isCorrect': _isCorrect,
      'isFlagged': _isFlagged,
      'answers': _answers,
    };
  }

  factory TheoryAssessment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TheoryAssessment(
      id: map['id'],
      isCorrect: map['isCorrect'],
      isFlagged: map['isFlagged'],
      answers: map['answers'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TheoryAssessment.fromJson(String source) =>
      TheoryAssessment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MultipleChoiceAssessment(id: $id, isCorrect: $_isCorrect, isFlagged: $_isFlagged, answer: $_answers)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TheoryAssessment &&
        o.id == id &&
        o._isCorrect == _isCorrect &&
        o._isFlagged == _isFlagged &&
        o._answers == _answers;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        _isCorrect.hashCode ^
        _isFlagged.hashCode ^
        _answers.hashCode;
  }
}

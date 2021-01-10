import 'dart:convert';

import 'assessment.dart';

class TheoryAssessment extends Assessment {
  bool _isCorrect;
  bool _isFlagged;
  List<String> _answers;
  int _creationTimeStamp;
  TheoryAssessment({
    String id,
    bool isCorrect,
    bool isFlagged = false,
    List<String> answers,
    int creationTimeStamp,
  })  : _isCorrect = isCorrect,
        _isFlagged = isFlagged,
        _answers = answers,
        _creationTimeStamp = creationTimeStamp,
        super(id);
  @override
  bool get correct => _isCorrect;

  @override
  bool get flagged => _isFlagged;

  @override
  List<String> get solution => _answers;

  @override
  int get creationTimeStamp => _creationTimeStamp;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isCorrect': _isCorrect,
      'isFlagged': _isFlagged,
      'answers': _answers,
      'creationTimeStamp': creationTimeStamp,
    };
  }

  factory TheoryAssessment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TheoryAssessment(
      id: map['id'],
      isCorrect: map['isCorrect'],
      isFlagged: map['isFlagged'],
      answers: map['answers'],
      creationTimeStamp: map['creationTimeStamp'],
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

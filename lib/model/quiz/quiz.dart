import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../assessment/assessment.dart';

class Quiz {
  final int id;
  final List<Assessment> assessments;
  int _currentAssessmentIndex;
  bool _isComplete;
  bool _isTimed;
  bool _isTutored;
  int _timeLeftInSeconds;
  Quiz({
    this.id,
    this.assessments,
    bool isComplete = false,
    int currentAssessmentIndex = 0,
    bool isTimed = false,
    bool isTutored = true,
    int timeLeftInSeconds,
  })  : _isComplete = isComplete,
        _currentAssessmentIndex = currentAssessmentIndex,
        _isTimed = isTimed,
        _isTutored = isTutored,
        _timeLeftInSeconds = timeLeftInSeconds ?? 0;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assessments': assessments?.map((x) => x?.toMap())?.toList(),
      'currentAssessmentIndex': _currentAssessmentIndex,
      'isComplete': _isComplete,
      'isTimed': _isTimed,
      'isTutored': _isTutored,
      'timeLeftInSeconds': _timeLeftInSeconds,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Quiz(
      id: map['id'],
      assessments: List<Assessment>.from(
          map['assessments']?.map((x) => Assessment.fromMap(x))),
      currentAssessmentIndex: map['_currentAssessmentIndex'],
      isComplete: map['isComplete'],
      isTimed: map['isTimed'],
      isTutored: map['isTutored'],
      timeLeftInSeconds: map['timeLeftInSeconds'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quiz(id: $id, assessments: $assessments, _currentAssessmentIndex: $_currentAssessmentIndex, _isComplete: $_isComplete, _isTimed: $_isTimed, _isTutored: $_isTutored, _timeLeftInSeconds: $_timeLeftInSeconds)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Quiz &&
        o.id == id &&
        listEquals(o.assessments, assessments) &&
        o._currentAssessmentIndex == _currentAssessmentIndex &&
        o._isComplete == _isComplete &&
        o._isTimed == _isTimed &&
        o._isTutored == _isTutored &&
        o._timeLeftInSeconds == _timeLeftInSeconds;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        assessments.hashCode ^
        _currentAssessmentIndex.hashCode ^
        _isComplete.hashCode ^
        _isTimed.hashCode ^
        _isTutored.hashCode ^
        _timeLeftInSeconds.hashCode;
  }
}

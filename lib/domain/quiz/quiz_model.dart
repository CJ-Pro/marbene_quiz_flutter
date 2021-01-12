import 'dart:convert';

class Quiz {
  final int id;
  final List<Map<String, dynamic>> assessments;
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
      'assessments': assessments,
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
      assessments: List.from(map['assessments'])
          ?.map((assessment) => Map<String, dynamic>.from(assessment))
          ?.toList(),
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

    return o is Quiz && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../model/assessment/assessment.dart';

@immutable
class Quiz {
  ///Quiz id generated using creation timestamp.
  final int id;

  ///Assessments list keep reference to questions.
  final List<Assessment> assessments;

  ///The index of the current assessment.
  final int index;

  ///If the quiz is completed.
  final bool isComplete;

  ///If the quiz is timed.
  final bool isTimed;

  //If the quiz shows corrections after an assessment is answered.
  final bool isTutored;

  ///Time left in seconds if the quiz is timed.
  final int timeLeftInSeconds;
  Quiz({
    this.id,
    this.assessments,
    this.index,
    this.isComplete,
    this.isTimed,
    this.isTutored,
    int timeLeftInSeconds,
  }) :
        //The time is calculated by summing the time given for each assessment.
        timeLeftInSeconds = timeLeftInSeconds ??
            assessments
                .map((assessment) => assessment.timeGivenInSeconds)
                .reduce((value, element) => value + element);

  Quiz copyWith({
    int id,
    List<Assessment> assessments,
    int index,
    bool isComplete,
    bool isTimed,
    bool isTutored,
    int timeLeftInSeconds,
  }) {
    return Quiz(
      id: id ?? this.id,
      assessments: assessments ?? this.assessments,
      index: index ?? this.index,
      isComplete: isComplete ?? this.isComplete,
      isTimed: isTimed ?? this.isTimed,
      isTutored: isTutored ?? this.isTutored,
      timeLeftInSeconds: timeLeftInSeconds ?? this.timeLeftInSeconds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assessments': assessments?.map((x) => x?.toMap())?.toList(),
      'index': index,
      'isComplete': isComplete,
      'isTimed': isTimed,
      'isTutored': isTutored,
      'timeLeftInSeconds': timeLeftInSeconds,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Quiz(
      id: map['id'],
      assessments: List<Assessment>.from(
        map['assessments']?.map(
          (assessment) => _getAssessment(
            Map<String, dynamic>.from(assessment),
          ),
        ),
      ),
      index: map['index'],
      isComplete: map['isComplete'],
      isTimed: map['isTimed'],
      isTutored: map['isTutored'],
      timeLeftInSeconds: map['timeLeftInSeconds'],
    );
  }

  Assessment _getAssessment(Map<String, dynamic> assessment) {
    final category = (assessment['category'] as String).toQuestionCategory;
    switch (category) {
      case QuestionCategory.multipleChoice:
        return MultipleChoiceAssessment.fromMap(assessment);
      case QuestionCategory.pictureTest:
        return MultipleChoiceAssessment.fromMap(assessment);
      case QuestionCategory.theory:
        return TheoryAssessment.fromMap(assessment);
      default:
        return null;
    }
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quiz(id: $id)';
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

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../assessment/model/assessment.dart';

@immutable
class Quiz {
  ///Quiz id generated using creation timestamp.
  final int id;

  ///Assessments list keep reference to questions.
  final UnmodifiableListView<Assessment> assessments;

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
    this.index = 0,
    this.isTimed = false,
    this.isTutored = true,
    bool isComplete = false,
    int timeLeftInSeconds,
  })  :
        //The time is calculated by summing the time given for each assessment.
        timeLeftInSeconds = timeLeftInSeconds ??
            assessments
                .map((assessment) => assessment.timeGivenInSeconds)
                .reduce((value, element) => value + element),
        isComplete = (isTimed && timeLeftInSeconds == 0) || isComplete;

  Quiz copyWith({
    int id,
    UnmodifiableListView<Assessment> assessments,
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

  factory Quiz.fromMap(map) {
    if (map == null) return null;

    Assessment getAssessment(map) {
      final category = (map['category'] as String).toQuestionCategory;
      switch (category) {
        case QuestionCategory.multipleChoice:
          return MultipleChoiceAssessment.fromMap(map);
        case QuestionCategory.pictureTest:
          return MultipleChoiceAssessment.fromMap(map);
        case QuestionCategory.theory:
          return TheoryAssessment.fromMap(map);
        default:
          return null;
      }
    }

    return Quiz(
      id: map['id'],
      assessments: UnmodifiableListView<Assessment>(
        List<Assessment>.from(
          map['assessments']?.map(getAssessment),
        ),
      ),
      index: map['index'],
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

import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'question.dart';

class Theory extends Question {
  final List<String> questions;
  final List<String> answers;
  Theory({
    String id,
    String name,
    String subject,
    String system,
    int year,
    this.questions,
    this.answers,
  }) : super(
          id: id,
          name: name,
          subject: subject,
          system: system,
          year: year,
        );
  @override
  QuestionCategory get category => QuestionCategory.theory;

  Theory copyWith({
    List<String> questions,
    List<String> answers,
    String subject,
    String system,
    int year,
    String name,
    String id,
  }) {
    return Theory(
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      subject: subject ?? this.subject,
      system: system ?? this.system,
      year: year ?? this.year,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questions': questions,
      'answers': answers,
      'subject': subject,
      'system': system,
      'year': year,
      'name': name,
      'id': id,
    };
  }

  factory Theory.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Theory(
      questions: List<String>.from(
        List<Map>.from(map['questions'])
            ?.map((e) => e['question'] as String)
            ?.toList(),
      ),
      answers: List<String>.from(
        List<Map>.from(map['answers'])
            ?.map((e) => e['answer'] as String)
            ?.toList(),
      ),
      subject: map['subject'],
      system: map['system'],
      year: map['year'],
      name: map['name'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Theory.fromJson(String source) => Theory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Theory(questions: $questions, answers: $answers, subject: $subject, system: $system, year: $year, name: $name, id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Theory &&
        listEquals(o.questions, questions) &&
        listEquals(o.answers, answers) &&
        o.subject == subject &&
        o.system == system &&
        o.year == year &&
        o.name == name &&
        o.id == id;
  }

  @override
  int get hashCode {
    return questions.hashCode ^
        answers.hashCode ^
        subject.hashCode ^
        system.hashCode ^
        year.hashCode ^
        name.hashCode ^
        id.hashCode;
  }

  @override
  Assessment get blankAssessment => TheoryAssessment.fromMap({'id': id});
}

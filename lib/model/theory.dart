import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'question.dart';

class Theory extends Question {
  final List<String> questions;
  final List<String> answers;
  final String subject;
  final String system;
  final int year;
  final String name;
  final int id;
  Theory({
    this.questions,
    this.answers,
    this.subject,
    this.system,
    this.year,
    this.name,
    this.id,
  }) : super(name: name, id: id, subject: subject, system: system);

  Theory copyWith({
    List<String> questions,
    List<String> answers,
    String subject,
    String system,
    String year,
    int id,
  }) {
    return Theory(
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      subject: subject ?? this.subject,
      system: system ?? this.system,
      year: year ?? this.year,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questions': questions,
      'answers': answers,
      'subject': subject,
      'system': system,
      'year': year,
      'id': id,
    };
  }

  factory Theory.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Theory(
      questions: List<Map<dynamic, dynamic>>.from(map['questions'] ?? [])
          .map((e) => (e['question'] as String))
          .toList(),
      answers: List<Map<dynamic, dynamic>>.from(map['answers'] ?? [])
          .map((e) => (e['answer'] as String))
          .toList(),
      subject: map['subject'],
      system: map['system'],
      year: map['year'],
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Theory.fromJson(String source) => Theory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Theory(questions: $questions, answers: $answers, subject: $subject, system: $system, year: $year, id: $id)';
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
        o.id == id;
  }

  @override
  int get hashCode {
    return questions.hashCode ^
        answers.hashCode ^
        subject.hashCode ^
        system.hashCode ^
        year.hashCode ^
        id.hashCode;
  }

  @override
  String get category => "theory";
}
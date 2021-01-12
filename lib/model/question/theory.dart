import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'question.dart';

@immutable
class Theory extends Question {
  final List<String> questions;
  final List<String> answers;
  Theory({
    int id,
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
    return 'Theory(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Theory && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  Assessment get newAssessment => TheoryAssessment(questionId: id);
}

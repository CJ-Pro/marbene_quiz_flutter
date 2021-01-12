import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'question.dart';

@immutable
class PictureTest extends Question {
  final String question;
  final int answer;
  final List<String> choices;
  final String explanation;
  PictureTest({
    int id,
    String name,
    String subject,
    String system,
    int year,
    this.question,
    this.answer,
    this.choices,
    this.explanation,
  }) : super(
          id: id,
          name: name,
          subject: subject,
          system: system,
          year: year,
        );

  @override
  QuestionCategory get category => QuestionCategory.pictureTest;

  PictureTest copyWith({
    int answer,
    List<String> choices,
    String explanation,
    String id,
    String name,
    String question,
    String subject,
    String system,
    int year,
  }) {
    return PictureTest(
      answer: answer ?? this.answer,
      choices: choices ?? this.choices,
      explanation: explanation ?? this.explanation,
      id: id ?? this.id,
      name: name ?? this.name,
      question: question ?? this.question,
      subject: subject ?? this.subject,
      system: system ?? this.system,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'choices': choices,
      'explanation': explanation,
      'id': id,
      'name': name,
      'question': question,
      'subject': subject,
      'system': system,
      'year': year,
    };
  }

  factory PictureTest.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PictureTest(
      answer: map['answer'],
      choices: List<String>.from(
        List<Map>.from(map['choices'])
            ?.map((e) => e['choice'] as String)
            ?.toList(),
      ),
      explanation: map['explanation'],
      id: map['id'],
      name: map['name'],
      question: map['question'],
      subject: map['subject'],
      system: map['system'],
      year: map['year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PictureTest.fromJson(String source) =>
      PictureTest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MultipleChoice(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PictureTest && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  Assessment get newAssessment => MultipleChoiceAssessment(questionId: id);
}

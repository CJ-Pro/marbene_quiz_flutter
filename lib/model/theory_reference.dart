import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'question_reference.dart';

class TheoryReference extends QuestionReference {
  int id;
  String category;
  bool isFlagged;
  List<String> answers;
  TheoryReference({
    this.id,
    this.category,
    this.isFlagged,
    this.answers,
  });

  TheoryReference copyWith({
    int id,
    String category,
    bool isFlagged,
    List<String> answers,
  }) {
    return TheoryReference(
      id: id ?? this.id,
      category: category ?? this.category,
      isFlagged: isFlagged ?? this.isFlagged,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'isFlagged': isFlagged,
      'answers': answers,
    };
  }

  factory TheoryReference.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TheoryReference(
      id: map['id'],
      category: map['category'],
      isFlagged: map['isFlagged'],
      answers: List<String>.from(map['answers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TheoryReference.fromJson(String source) =>
      TheoryReference.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TheoryReference(id: $id, category: $category, isFlagged: $isFlagged, answers: $answers)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TheoryReference &&
        o.id == id &&
        o.category == category &&
        o.isFlagged == isFlagged &&
        listEquals(o.answers, answers);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        isFlagged.hashCode ^
        answers.hashCode;
  }
}

import 'dart:convert';

import 'question_reference.dart';

class MultipleChoiceReference extends QuestionReference {
  int id;
  String category;
  bool isFlagged;
  int answer;
  MultipleChoiceReference({
    this.id,
    this.category,
    this.isFlagged,
    this.answer,
  });

  MultipleChoiceReference copyWith({
    int id,
    String category,
    bool isFlagged,
    int answer,
  }) {
    return MultipleChoiceReference(
      id: id ?? this.id,
      category: category ?? this.category,
      isFlagged: isFlagged ?? this.isFlagged,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'isFlagged': isFlagged,
      'answer': answer,
    };
  }

  factory MultipleChoiceReference.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MultipleChoiceReference(
      id: map['id'],
      category: map['category'],
      isFlagged: map['isFlagged'],
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoiceReference.fromJson(String source) =>
      MultipleChoiceReference.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MultipleChoiceReference(id: $id, category: $category, isFlagged: $isFlagged, answer: $answer)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoiceReference &&
        o.id == id &&
        o.category == category &&
        o.isFlagged == isFlagged &&
        o.answer == answer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        isFlagged.hashCode ^
        answer.hashCode;
  }
}

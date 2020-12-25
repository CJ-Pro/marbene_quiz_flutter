import 'dart:convert';

import 'question_reference.dart';

class PictureTestReference extends QuestionReference {
  int id;
  String category;
  bool isFlagged;
  int answer;
  PictureTestReference({
    this.id,
    this.category,
    this.isFlagged,
    this.answer,
  });

  PictureTestReference copyWith({
    int id,
    String category,
    bool isFlagged,
    int answer,
  }) {
    return PictureTestReference(
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

  factory PictureTestReference.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PictureTestReference(
      id: map['id'],
      category: map['category'],
      isFlagged: map['isFlagged'],
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PictureTestReference.fromJson(String source) =>
      PictureTestReference.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PictureTestReference(id: $id, category: $category, isFlagged: $isFlagged, answer: $answer)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PictureTestReference &&
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

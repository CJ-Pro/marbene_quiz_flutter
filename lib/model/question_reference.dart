abstract class QuestionReference {
  int id;
  String category;
  bool isFlagged;
  Map<String, dynamic> toMap();

  static fromMap(x) {}
}

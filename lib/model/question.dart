abstract class Question {
  Question({this.system, this.subject, this.id, this.name});

  String get category;
  final String system;
  final String subject;
  final int id;
  final String name;
}

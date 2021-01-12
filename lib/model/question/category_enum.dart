const String _multipleChoice = 'multipleChoice';
const String _pictureTest = 'pictureTest';
const String _theory = 'theory';

enum QuestionCategory { multipleChoice, pictureTest, theory }

extension QuestionCatergoryExtension on QuestionCategory {
  static const _values = <QuestionCategory, String>{
    QuestionCategory.multipleChoice: _multipleChoice,
    QuestionCategory.pictureTest: _pictureTest,
    QuestionCategory.theory: _theory
  };

  String get value => _values[this];
}

extension QuestionCategoryStringExtension on String {
  static const _values = <String, QuestionCategory>{
    _multipleChoice: QuestionCategory.multipleChoice,
    _pictureTest: QuestionCategory.pictureTest,
    _theory: QuestionCategory.theory
  };

  QuestionCategory get toQuestionCategory => _values[this];
}

import 'package:firebase_database/firebase_database.dart';
import '../model/question.dart';
import '../model/multiple_choice.dart';
import '../model/picture_test.dart';
import '../model/theory.dart';

class QuestionRepository {
  static var _database = FirebaseDatabase.instance;
  static DatabaseReference _reference = _database.reference();

  QuestionRepository() {
    _database.setPersistenceEnabled(true);
  }
  Future<List<MultipleChoice>> get getMultipleChoice async {
    var multipleChoiceRef = _reference.child(getPath('multipleChoice'));
    multipleChoiceRef.keepSynced(true);
    var snapshot = await multipleChoiceRef.once();
    List questions = Map.from(snapshot.value).values.toList();
    return questions
        .map(
          (element) => MultipleChoice.fromMap(
            Map<String, dynamic>.from(element),
          ),
        )
        .toList();
  }

  Future<List<PictureTest>> get getPictureTest async {
    var pictureTestRef = _reference.child(getPath('pictureTest'));
    pictureTestRef.keepSynced(true);
    var snapshot = await pictureTestRef.once();
    List questions = Map.from(snapshot.value).values.toList();
    return questions
        .map(
          (element) => PictureTest.fromMap(
            Map<String, dynamic>.from(element),
          ),
        )
        .toList();
  }

  Future<List<Theory>> get getTheory async {
    var theoryRef = _reference.child(getPath('theory'));
    theoryRef.keepSynced(true);
    var snapshot = await theoryRef.once();
    List questions = Map.from(snapshot.value).values.toList();
    return questions
        .map(
          (element) => Theory.fromMap(
            Map<String, dynamic>.from(element),
          ),
        )
        .toList();
  }

  Future<Question> getQuestion(String category, int id) async {
    var questionRef = _reference.child(getPath(category));
    var snapshot = await questionRef.once();
    Map questionMap = Map.from(snapshot.value);
    return {
      "multipleChoice": MultipleChoice.fromMap(questionMap[id]),
      "pictureTest": PictureTest.fromMap(questionMap[id]),
      "theory": Theory.fromMap(questionMap[id]),
    }[category];
  }

  Future<List<Question>> get getAll async {
    var multipleChoice = await getMultipleChoice;
    var pictureTest = await getPictureTest;
    var theory = await getTheory;
    return [...multipleChoice, ...pictureTest, ...theory];
  }

  String getPath(String category) =>
      'flamelink/environments/production/content/$category/en-US';
}

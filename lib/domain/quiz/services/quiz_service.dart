import '../model/quiz.dart';
import '../repository/quiz_repository.dart';

class QuizService extends QuizRepository {
  Future<List<Quiz>> getAllPreviousQuizSortedByTimestamp() async {
    final previousQuiz = await getAllPreviousQuiz();
    //Timestamp used as id
    previousQuiz?.sort((a, b) => a.id.compareTo(b.id));
    return previousQuiz;
  }
}

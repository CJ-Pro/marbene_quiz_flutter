import 'quiz_model.dart';
import 'quiz_repository.dart';

class QuizService extends QuizRepository {
  Future<List<Quiz>> getAllPreviousQuizSortedByTimestamp() async {
    return await getAllPreviousQuiz()
      ..sort((a, b) => a.id.compareTo(b.id)); //timestamp used as id
  }
}

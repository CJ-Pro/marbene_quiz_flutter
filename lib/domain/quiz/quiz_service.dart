import 'quiz_model.dart';
import 'quiz_repository.dart';

class QuizService extends QuizRepository {
  Future<List<Quiz>> getPreviousQuizSortedByTimestamp() async {
    return await getPreviousQuiz()
      ..sort((a, b) => a.id.compareTo(b.id)); //timestamp used as id
  }
}

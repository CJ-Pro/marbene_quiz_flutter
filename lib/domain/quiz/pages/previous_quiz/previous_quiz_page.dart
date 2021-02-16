import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/loading/loading.dart';
import '../../model/quiz.dart';
import '../../viewmodel/previous_quiz_viewmodel.dart';
import '../quiz/quiz_page.dart';

class PreviousQuizPage extends StatelessWidget {
  const PreviousQuizPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getYesOrNo(bool value) => value ? 'Yes' : 'No';

    int getPercentageComplete(Quiz quiz) {
      final assessments = quiz.assessments;
      final totalAnswered = assessments
          .map((assessment) => assessment.answer != null ? 1 : 0)
          .reduce((total, current) => total + current);
      final percentage = (totalAnswered / assessments.length) * 100;
      return percentage.round();
    }

    Widget smallSpacing() => const SizedBox(height: 8);

    final _viewmodel = Get.put(PreviousQuizViewModel());
    return Scaffold(
      body: SafeArea(
        child: _viewmodel.obx(
          (state) => ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final quiz = state[index];
              return GestureDetector(
                onTap: () async {
                  await Get.to(
                    QuizPage(quiz: quiz),
                  );
                  _viewmodel.reload();
                },
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Quiz ${index + 1}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        smallSpacing(),
                        Text(
                          'Created on ${DateFormat.yMMMEd().add_jm().format(DateTime.fromMillisecondsSinceEpoch(quiz.id))}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        smallSpacing(),
                        Text(
                          'Completed: ${getYesOrNo(quiz.isComplete)}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        smallSpacing(),
                        Text(
                          'Tutored: ${getYesOrNo(quiz.isTutored)}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        smallSpacing(),
                        Text(
                          'Timed: ${getYesOrNo(quiz.isTimed)}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        smallSpacing(),
                        quiz.isTimed
                            ? Text(
                                'Time Left in seconds: ${quiz.timeLeftInSeconds}',
                                style: Theme.of(context).textTheme.headline2,
                              )
                            : const SizedBox.shrink(),
                        smallSpacing(),
                        Text(
                          'Percentage Complete: ${getPercentageComplete(quiz)}%',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          onLoading: const Loading(),
          onEmpty: const Center(
              child: Text(
            'No quiz available. Create a new quiz to get started.',
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}

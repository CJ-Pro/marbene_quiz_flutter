import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/loading/loading.dart';
import '../../viewmodel/previous_quiz_viewmodel.dart';
import '../start_quiz/start_quiz_page.dart';

class PreviousQuizPage extends StatelessWidget {
  const PreviousQuizPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.put(PreviousQuizViewModel());
    return Scaffold(
      body: SafeArea(
        child: _viewmodel.obx(
          (state) => ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final quiz = state[index];
              return GestureDetector(
                onTap: () => Get.to(
                  StartQuizPage(
                    quiz: quiz,
                  ),
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      'Quiz ${quiz.id}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
          onLoading: const Loading(),
        ),
      ),
    );
  }
}

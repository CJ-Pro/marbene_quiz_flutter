import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marbene/domain/quiz/quiz_model.dart';
import '../../quiz_viewmodel.dart';

class PreviousQuiz extends StatelessWidget {
  const PreviousQuiz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _quizViewModel = Get.put(QuizViewModel());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child:
            // ignore: prefer_const_constructors
            Obx(
          () => _quizViewModel.isLoading
              ? const Text('loading')
              : FutureBuilder<List<Quiz>>(
                  future: _quizViewModel.getPreviousQuiz(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data
                            .map(
                              (quiz) => Text(
                                quiz.toString(),
                              ),
                            )
                            .toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                ),
        ),
      ),
    );
  }
}

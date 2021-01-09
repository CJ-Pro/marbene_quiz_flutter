import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../quiz_viewmodel.dart';

class CreateQuiz extends StatelessWidget {
  const CreateQuiz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _quizViewModel = Get.put(QuizViewModel());
    return Scaffold(
      body: Center(
        child:
            // ignore: prefer_const_constructors
            Obx(() =>
                _quizViewModel.isLoading ? Text('loading') : Text('done')),
      ),
    );
  }
}

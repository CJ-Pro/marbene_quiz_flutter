import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../quiz_viewmodel.dart';

class CreateQuizPage extends StatelessWidget {
  const CreateQuizPage({Key key}) : super(key: key);

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

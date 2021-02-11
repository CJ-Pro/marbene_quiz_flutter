import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class CreateQuizButton extends StatelessWidget {
  const CreateQuizButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return FlatButton(
      child: Text(
        'CREATE QUIZ',
        style: Theme.of(context).textTheme.button,
      ),
      padding: const EdgeInsets.all(25),
      onPressed: _viewmodel.createQuiz,
      color: Theme.of(context).accentColor,
    );
  }
}

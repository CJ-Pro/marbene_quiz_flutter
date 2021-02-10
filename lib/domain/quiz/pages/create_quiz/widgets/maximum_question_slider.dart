import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class MaximumQuestionSlider extends StatelessWidget {
  const MaximumQuestionSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 1 / 50 * Get.width,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'MAXIMUM NUMBER OF QUESTIONS: ${_viewmodel.maxNumberOfQuestions.round()}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Slider.adaptive(
              value: _viewmodel.maxNumberOfQuestions,
              onChanged: (value) => _viewmodel.maxNumberOfQuestions = value,
              activeColor: Theme.of(context).accentColor,
              label: '${_viewmodel.maxNumberOfQuestions.round()}',
              min: 5,
              max: 50,
              divisions: 9,
            ),
          ],
        ),
      ),
    );
  }
}

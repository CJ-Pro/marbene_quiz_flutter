import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class TimerSwitch extends StatelessWidget {
  const TimerSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return Obx(() => Row(
          children: [
            Text(
              'TIMER',
              style: Theme.of(context).textTheme.headline1,
            ),
            Switch.adaptive(
              value: _viewmodel.hasTimer,
              onChanged: (value) => _viewmodel.hasTimer = value,
              activeColor: Theme.of(context).accentColor,
              focusColor: Theme.of(context).accentColor,
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/selection_slider/selection_slider.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class SelectTimer extends StatelessWidget {
  const SelectTimer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return SelectionSlider(
      title: 'TIMER',
      items: [
        SelectionSliderItem(
          title: 'Yes',
          description:
              'Maximum time limit for quiz based on number of questions. Timer paused when reviewing corrections.',
          iconData: Icons.timer_rounded,
          onTap: () {},
          color: Colors.greenAccent,
          selected: true,
        ),
        SelectionSliderItem(
          title: 'No',
          description: 'No time limit. Complete quiz at own pace.',
          iconData: Icons.timer_off_rounded,
          onTap: () {},
          color: Colors.redAccent,
        ),
      ],
    );
  }
}

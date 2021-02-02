import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/selection_slider/selection_slider.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class SelectTutor extends StatelessWidget {
  const SelectTutor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return SelectionSlider(
      title: 'TUTOR',
      items: [
        SelectionSliderItem(
          title: 'Yes',
          description:
              'Corrections and explanations after answering each question.',
          iconData: Icons.thumb_up_alt_rounded,
          onTap: () {},
          color: Colors.greenAccent,
          selected: true,
        ),
        SelectionSliderItem(
          title: 'No',
          description: 'No corrections and explanations till quiz is complete.',
          iconData: Icons.thumb_down_alt_rounded,
          onTap: () {},
          color: Colors.redAccent,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/selection_slider/selection_slider.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class SelectSystem extends StatelessWidget {
  const SelectSystem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return SelectionSlider(
      title: 'SYSTEM',
      items: [
        SelectionSliderItem(
          title: 'All',
          description: 'All systems.',
          iconData: Icons.all_inclusive_rounded,
          onTap: () {},
          selected: true,
        ),
        for (var system in _viewmodel.questionData['systems'])
          SelectionSliderItem(
            title: system,
            description: system,
            onTap: () {},
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/selection_slider/selection_slider.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class SelectSubject extends StatelessWidget {
  final Set<String> subjects;
  const SelectSubject({
    Key key,
    @required this.subjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return SelectionSlider(
      title: 'SUBJECT',
      items: [
        SelectionSliderItem(
          title: 'All',
          description: 'All subjects.',
          iconData: Icons.all_inclusive_rounded,
          onTap: () => _viewmodel.subject = null,
          selected: true,
        ),
        for (var subject in subjects)
          SelectionSliderItem(
            title: subject,
            description: subject,
            onTap: () => _viewmodel.subject = subject,
          ),
      ],
    );
  }
}

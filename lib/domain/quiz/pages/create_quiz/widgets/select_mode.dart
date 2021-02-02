import 'package:flutter/material.dart';
import '../../../../../widgets/selection_slider/selection_slider.dart';

class SelectMode extends StatelessWidget {
  const SelectMode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionSlider(
      title: 'MODE',
      items: [
        SelectionSliderItem(
          title: 'None',
          description: 'All questions available.',
          color: Colors.grey,
          iconData: Icons.not_interested_rounded,
          onTap: () {},
          selected: true,
        ),
        SelectionSliderItem(
          title: 'Incorrect',
          description: 'Only questions answered incorrectly in the past.',
          color: Colors.redAccent,
          iconData: Icons.clear_rounded,
          onTap: () {},
        ),
        SelectionSliderItem(
          title: 'Answered',
          description: 'All questions answered in the past.',
          color: Colors.greenAccent,
          iconData: Icons.question_answer_rounded,
          onTap: () {},
        ),
        SelectionSliderItem(
          title: 'Flagged',
          description: 'All questions flagged in the past.',
          color: Colors.blueAccent,
          iconData: Icons.flag_rounded,
          onTap: () {},
        ),
      ],
    );
  }
}

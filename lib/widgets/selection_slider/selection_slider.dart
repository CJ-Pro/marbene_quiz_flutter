import 'package:flutter/material.dart';
import 'selection_slider_item.dart';

export 'selection_slider_item.dart';

class SelectionSlider extends StatelessWidget {
  final String title;
  final List<SelectionSliderItem> items;
  const SelectionSlider({
    Key key,
    @required this.title,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: items,
            ),
          ),
        )
      ],
    );
  }
}

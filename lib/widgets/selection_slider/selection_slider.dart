import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'selection_slider_item.dart';

export 'selection_slider_item.dart';

class SelectionSlider extends StatefulWidget {
  final String title;
  final List<SelectionSliderItem> items;
  const SelectionSlider({
    Key key,
    @required this.title,
    @required this.items,
  }) : super(key: key);

  @override
  _SelectionSliderState createState() => _SelectionSliderState();
}

class _SelectionSliderState extends State<SelectionSlider> {
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Header(title: widget.title),
        _ItemScroll(
          items: widget.items,
          selectedIndex: selectedIndex,
          onSelect: (index) {
            setState(() => selectedIndex = index);
          },
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 1 / 18 * Get.width,
      ),
      child: const Text(
        'No Special Mode.',
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ItemScroll extends StatelessWidget {
  const _ItemScroll({
    Key key,
    @required this.items,
    @required this.selectedIndex,
    @required this.onSelect,
  }) : super(key: key);

  final List<SelectionSliderItem> items;
  final int selectedIndex;
  final void Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.asMap().keys.map((index) {
          final sliderItem = items[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              sliderItem.onTap();
              onSelect(index);
            },
            child: sliderItem.copyWith(
              selected: selectedIndex == index,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 1 / 18 * Get.width,
        vertical: 1 / 36 * Get.width,
      ),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}

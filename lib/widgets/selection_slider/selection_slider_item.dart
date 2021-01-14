import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';

class SelectionSliderItem extends StatefulWidget {
  final Widget icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  final bool selected;
  const SelectionSliderItem(
      {Key key, this.icon, this.title, this.color, this.onTap, this.selected})
      : super(key: key);

  @override
  _SelectionSliderItemState createState() => _SelectionSliderItemState();
}

class _SelectionSliderItemState extends State<SelectionSliderItem> {
  Color color;
  @override
  void initState() {
    color = widget.color ??
        RandomColor().randomColor(
          colorSaturation: ColorSaturation.lowSaturation,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _oneThirdScreenWidth = 1 / 3 * Get.width;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(1 / 36 * Get.width),
        width: _oneThirdScreenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: _oneThirdScreenWidth,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const Text(
              'Cardiovascular.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 21,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';

class SelectionSliderItem extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;
  final bool selected;
  const SelectionSliderItem({
    Key key,
    this.iconData,
    @required this.title,
    @required this.description,
    @required this.onTap,
    this.color,
    this.selected = false,
  }) : super(key: key);

  SelectionSliderItem copyWith({
    String title,
    String description,
    Color color,
    IconData iconData,
    VoidCallback onTap,
    bool selected,
  }) {
    return SelectionSliderItem(
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      iconData: iconData ?? this.iconData,
      onTap: onTap ?? this.onTap,
      selected: selected ?? this.selected,
    );
  }

  @override
  _SelectionSliderItemState createState() => _SelectionSliderItemState();
}

class _SelectionSliderItemState extends State<SelectionSliderItem> {
  Color color;
  @override
  void initState() {
    super.initState();
    color = widget.color ??
        RandomColor().randomColor(
          colorSaturation: ColorSaturation.lowSaturation,
        );
  }

  @override
  Widget build(BuildContext context) {
    final _oneThirdScreenWidth = 1 / 4 * Get.width;
    final _itemMargin = EdgeInsets.only(
      top: 1 / 40 * Get.width,
      left: 1 / 40 * Get.width,
    );
    return Container(
      margin: _itemMargin,
      width: _oneThirdScreenWidth,
      child: Column(
        children: [
          _itemTab(width: _oneThirdScreenWidth),
          _itemTitle(padding: _itemMargin),
        ],
      ),
    );
  }

  Widget _itemTab({@required double width}) => Container(
        alignment: Alignment.topCenter,
        height: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: kElevationToShadow[widget.selected ? 0 : 12],
          border: widget.selected
              ? Border.all(color: Colors.black45, width: 12)
              : null,
        ),
        child: Center(
          child: widget.iconData == null
              ? Text(
                  widget.title[0],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )
              : Icon(widget.iconData, size: 40, color: Colors.white),
        ),
      );

  Widget _itemTitle({@required EdgeInsetsGeometry padding}) => Padding(
        padding: padding,
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}

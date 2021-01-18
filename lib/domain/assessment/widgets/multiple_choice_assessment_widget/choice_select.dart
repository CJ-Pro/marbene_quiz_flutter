import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoiceSelect extends StatelessWidget {
  final String choice;
  final VoidCallback onTap;
  final String label;
  final bool isSelected;
  final bool isSubmitted;
  final bool isCorrect;
  final int index;
  const ChoiceSelect(
      {Key key,
      this.choice,
      this.label,
      this.onTap,
      this.isSelected = false,
      this.isSubmitted = false,
      this.isCorrect,
      this.index})
      : super(key: key);

  Color get decorationColor {
    if (isSubmitted) {
      if (isCorrect) return Colors.greenAccent;
      if (isSelected) return Colors.red;
    }
    if (isSelected) return Colors.black45;
    return Colors.transparent;
  }

  Color get textColor {
    if (isSubmitted) {
      if (isCorrect) return Colors.white;
      if (isSelected) return Colors.white;
    }
    if (isSelected) return Colors.white;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final _defaultTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: textColor,
    );

    return GestureDetector(
      onTap: isSubmitted ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: decorationColor,
          border: Border(
            top: index == 0
                ? const BorderSide(color: Colors.black, width: 0.2)
                : BorderSide.none,
            bottom: const BorderSide(color: Colors.black, width: 0.2),
          ),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Text(label, style: _defaultTextStyle),
            Expanded(
              child: Text(
                choice,
                textAlign: TextAlign.center,
                style: _defaultTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

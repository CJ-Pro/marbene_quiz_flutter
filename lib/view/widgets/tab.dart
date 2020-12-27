import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const TabWidget({Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 0.04 * Get.width,
          ),
          height: 1 / 7 * Get.height,
          width: 7 / 10 * Get.width,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(
              0.05 * Get.width,
            ),
          ),
        ),
      ),
    );
  }
}

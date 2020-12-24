import 'package:flutter/material.dart';

class FreeTestButton extends StatelessWidget {
  const FreeTestButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => print('object'),
      color: Colors.blue,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Text(
          'Free Test',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CreateQuizButton extends StatelessWidget {
  const CreateQuizButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'CREATE QUIZ',
        style: Theme.of(context).textTheme.button,
      ),
      padding: const EdgeInsets.all(25),
      onPressed: () {},
      color: Theme.of(context).accentColor,
    );
  }
}

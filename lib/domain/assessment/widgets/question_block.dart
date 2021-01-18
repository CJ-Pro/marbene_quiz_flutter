import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class QuestionBlock extends StatelessWidget {
  final String question;
  const QuestionBlock({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _default = Style(
      color: Colors.black,
      fontSize: const FontSize(22),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      wordSpacing: 0.5,
    );

    final _styles = {
      'span': _default,
      'bold': _default.copyWith(fontWeight: FontWeight.bold),
      'p': _default,
    };

    return Html(
      data: question,
      style: _styles,
    );
  }
}

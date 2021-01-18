import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class ExplanationBlock extends StatelessWidget {
  final String explanation;
  const ExplanationBlock({Key key, this.explanation}) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Html(
            data: explanation,
            style: _styles,
          ),
        ),
      ),
    );
  }
}

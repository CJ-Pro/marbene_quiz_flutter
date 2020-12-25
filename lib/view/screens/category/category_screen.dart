import 'package:flutter/material.dart';
import '../../../model/question.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/tab.dart';

class CategoryScreen extends StatelessWidget {
  final List<Question> questions;
  const CategoryScreen({
    Key key,
    @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<String> systems = questions.map((e) => e.system).toSet();
    return AppScaffold(
      body: ListView(
        children: systems
            .map(
              (system) => TabWidget(
                title: system,
                onPressed: null,
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../test/test_screen.dart';
import '../../../model/question.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/tab.dart';

class SystemScreen extends StatelessWidget {
  final List<Question> questions;
  const SystemScreen({
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
                onPressed: () => Get.to(
                  TestScreen(
                    testId:
                        "${questions.first.category}_${questions.first.subject}_$system",
                    questions: questions
                        .where(
                          (element) => system == element.system,
                        )
                        .toList(),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

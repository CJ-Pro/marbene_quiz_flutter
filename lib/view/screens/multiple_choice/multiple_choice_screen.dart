import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marbene/model/question.dart';
import 'package:marbene/view/screens/category/category_screen.dart';
import 'package:marbene/view/widgets/tab.dart';
import '../../../repository/question_repository.dart';
import '../../widgets/app_scaffold.dart';

class MultipleChoiceScreen extends StatelessWidget {
  const MultipleChoiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => QuestionRepository());
    return AppScaffold(
      body: FutureBuilder(
        future: Get.find<QuestionRepository>().getMultipleChoice,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var questions = List<Question>.from(snapshot.data);
            questions.shuffle();
            var subjects = questions.map((e) => e.subject).toSet();
            return ListView(
              children: List<Widget>.from(
                subjects
                    .map(
                      (subject) => TabWidget(
                        title: subject,
                        onPressed: () => Get.to(
                          CategoryScreen(
                            questions: questions
                                .where((element) => element.subject == subject)
                                .toList(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            Get.snackbar(
              'Error',
              snapshot.error.toString(),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );

            return Center(child: Text('Failed to load questions'));
          }

          return Center(child: Text('loading...'));
        },
      ),
    );
  }
}

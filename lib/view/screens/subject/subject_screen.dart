import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../system/system_screen.dart';
import '../../widgets/tab.dart';
import '../../../model/question.dart';
import '../../../repository/question_repository.dart';
import '../../widgets/app_scaffold.dart';

class SubjectScreen extends StatefulWidget {
  final String category;
  const SubjectScreen({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  Future<List<Question>> _future;

  @override
  void initState() {
    Get.lazyPut(() => QuestionRepository());
    if (widget.category == "multipleChoice")
      _future = Get.find<QuestionRepository>().getMultipleChoice;
    else if (widget.category == "pictureTest")
      _future = Get.find<QuestionRepository>().getPictureTest;
    else
      _future = Get.find<QuestionRepository>().getTheory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: FutureBuilder(
        future: _future,
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
                          SystemScreen(
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

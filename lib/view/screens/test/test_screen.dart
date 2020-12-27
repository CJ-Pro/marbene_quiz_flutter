import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marbene/model/question_reference.dart';
import '../../widgets/app_scaffold.dart';
import '../../../repository/test_repository.dart';
import '../../../model/question.dart';
import '../../../model/test.dart';

class TestScreen extends StatelessWidget {
  final String testId;
  final List<Question> questions;
  const TestScreen({
    Key key,
    @required this.testId,
    @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TestRepository());
    return AppScaffold(
      body: FutureBuilder(
        future: Get.find<TestRepository>().getOrCreateUserTest(testId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text('Calm'));
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

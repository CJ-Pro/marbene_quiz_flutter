import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marbene/domain/quiz/quiz_model.dart';
import 'package:marbene/model/assessment/assessment.dart';
import 'package:marbene/widgets/assestment_widget/multiple_choice_assessment_widget.dart';

import '../../quiz_viewmodel.dart';

class PreviousQuizPage extends StatefulWidget {
  const PreviousQuizPage({Key key}) : super(key: key);

  @override
  _PreviousQuizPageState createState() => _PreviousQuizPageState();
}

class _PreviousQuizPageState extends State<PreviousQuizPage> {
  Future<Quiz> _future;
  QuizViewModel _quizViewModel;
  @override
  void initState() {
    _quizViewModel = Get.put(QuizViewModel());
    _future = _quizViewModel.getOneQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Obx(
          () => _quizViewModel.isLoading
              ? const Text('loading')
              : FutureBuilder<Quiz>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data.assessments
                            .map(
                              (assessment) => Test(
                                assessment: assessment,
                              ),
                            )
                            .toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                ),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  final Assessment assessment;
  const Test({Key key, this.assessment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultipleChoiceAssessmentWidget().render(context, assessment);
  }
}

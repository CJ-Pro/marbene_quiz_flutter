import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../model/question/question.dart';
import '../../repository/question_repository.dart';
import 'assessment_widget.dart';

class MultipleChoiceAssessmentWidget extends AssessmentWidget {
  @override
  Widget render(BuildContext context, Assessment assessment) {
    return _MultipleChoiceQuestionView(
      assessment: assessment,
    );
  }
}

class _MultipleChoiceQuestionView extends StatelessWidget {
  final Assessment assessment;
  const _MultipleChoiceQuestionView({Key key, @required this.assessment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Question>(
      future:
          Get.find<QuestionRepository>().getQuestionById(assessment.questionId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final questionData = snapshot.data as MultipleChoice;
          return Container(
            height: 200,
            child: ListView(
              children: [
                _QuestionBlock(question: questionData.question),
              ],
            ),
          );
        } else if (snapshot.hasError)
          return Container(color: Colors.red);
        else
          return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _QuestionBlock extends StatelessWidget {
  final String question;
  const _QuestionBlock({Key key, @required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: question,
    );
  }
}

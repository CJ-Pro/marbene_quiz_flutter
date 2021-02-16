import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assessment/model/assessment.dart';
import '../../../assessment/widgets/assessment_widget.dart';
import '../../model/quiz.dart';
import '../../viewmodel/quiz_viewmodel.dart';

class QuizPage extends StatelessWidget {
  final Quiz quiz;
  const QuizPage({Key key, this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.put(QuizViewModel(quiz));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _viewmodel.obx(
          (state) => Column(
            children: [
              _TopBar(viewmodel: _viewmodel),
              Expanded(
                child: PageView.builder(
                  itemCount: state.assessments.length,
                  controller: _viewmodel.pageController,
                  onPageChanged: _viewmodel.updatePageIndex,
                  itemBuilder: (_, index) {
                    final assessment = state.assessments[index];

                    return assessmentWidget(assessment);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget assessmentWidget(Assessment assessment) {
    if (assessment is MultipleChoiceAssessment) {
      return MultipleChoiceAssessmentWidget(assessment);
    } else if (assessment is TheoryAssessment) {
      return const Center(
        child: Text('Work in Progress.'),
      );
    } else {
      return Container();
    }
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    Key key,
    @required QuizViewModel viewmodel,
  })  : _viewmodel = viewmodel,
        super(key: key);

  final QuizViewModel _viewmodel;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: const Icon(
                Icons.report_rounded,
                size: 30,
              ),
              onPressed: () {}),
          Text(
            'Question ${_viewmodel.currentPage} of ${_viewmodel.totalPages}',
            style: Theme.of(context).textTheme.headline2,
          ),
          IconButton(
              icon: const Icon(
                Icons.flag_rounded,
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}

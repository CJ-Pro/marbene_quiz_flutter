import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marbene/domain/quiz/pages/create_quiz/widgets/create_quiz_button.dart';

import '../../viewmodel/create_quiz_viewmodel.dart';
import 'widgets/maximum_question_slider.dart';
import 'widgets/select_category.dart';
import 'widgets/select_mode.dart';
import 'widgets/select_subject.dart';
import 'widgets/select_system.dart';
import 'widgets/timer_switch.dart';
import 'widgets/tutor_switch.dart';

class CreateQuizPage extends StatelessWidget {
  const CreateQuizPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Get.put(CreateQuizViewModel());
    return Scaffold(
      backgroundColor: Colors.white,
      body: _viewModel.obx(
        (state) => SafeArea(
          child: Column(
            children: [
              Text(
                '${state.length} question choices',
                style: Theme.of(context).textTheme.headline1,
              ),
              Expanded(
                child: ListView(
                  children: [
                    const SelectMode(),
                    SelectCategory(
                      categories: _viewModel.categories,
                    ),
                    SelectSubject(
                      subjects: _viewModel.subjects,
                    ),
                    SelectSystem(
                      systems: _viewModel.systems,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [const TimerSwitch(), const TutorSwitch()],
                    ),
                    const SizedBox(height: 12),
                    const MaximumQuestionSlider(),
                    const CreateQuizButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

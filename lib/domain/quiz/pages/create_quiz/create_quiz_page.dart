import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodel/create_quiz_viewmodel.dart';
import 'widgets/select_category.dart';
import 'widgets/select_mode.dart';
import 'widgets/select_subject.dart';
import 'widgets/select_system.dart';
import 'widgets/select_timer.dart';
import 'widgets/select_tutor.dart';

class CreateQuizPage extends StatelessWidget {
  const CreateQuizPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Get.put(CreateQuizViewModel());
    return Scaffold(
      backgroundColor: Colors.white,
      body: _viewModel.obx(
        (state) => SafeArea(
          child: ListView(
            children: [
              Center(
                child: Text(
                  '${state.length}',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
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
              const SelectTutor(),
              const SelectTimer(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class TutorSwitch extends StatelessWidget {
  const TutorSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return Obx(() => Row(
          children: [
            Text(
              'TUTOR',
              style: Theme.of(context).textTheme.headline1,
            ),
            Switch.adaptive(
              value: _viewmodel.hasTutor,
              onChanged: (value) => _viewmodel.hasTutor = value,
              activeColor: Theme.of(context).accentColor,
              focusColor: Theme.of(context).accentColor,
            ),
          ],
        ));
  }
}

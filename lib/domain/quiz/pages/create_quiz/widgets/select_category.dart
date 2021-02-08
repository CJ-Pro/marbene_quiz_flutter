import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/selection_slider/selection_slider.dart';
import '../../../../question/model/category_enum.dart';
import '../../../viewmodel/create_quiz_viewmodel.dart';

class SelectCategory extends StatelessWidget {
  final Set<String> categories;
  const SelectCategory({
    Key key,
    @required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewmodel = Get.find<CreateQuizViewModel>();
    return SelectionSlider(
      title: 'CATEGORY',
      items: [
        SelectionSliderItem(
          title: 'All',
          description: 'All categories available.',
          iconData: Icons.all_inclusive_rounded,
          onTap: () {},
          selected: true,
        ),
        for (var categoryString in categories)
          _getCategorySliderItem(categoryString.toQuestionCategory)
      ],
    );
  }

  SelectionSliderItem _getCategorySliderItem(QuestionCategory category) {
    switch (category) {
      case QuestionCategory.multipleChoice:
        return SelectionSliderItem(
          title: 'Multiple Choice',
          description: 'Only multiple choice questions.',
          iconData: Icons.article_rounded,
          onTap: () {},
        );
        break;
      case QuestionCategory.pictureTest:
        return SelectionSliderItem(
          title: 'Picture Test',
          description: 'Only picture questions.',
          iconData: Icons.picture_in_picture_alt_rounded,
          onTap: () {},
        );
        break;
      case QuestionCategory.theory:
        return SelectionSliderItem(
          title: 'Theory',
          description: 'Only theory questions.',
          iconData: Icons.school_rounded,
          onTap: () {},
        );
        break;
    }
    return null;
  }
}

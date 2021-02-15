import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../quiz/viewmodel/quiz_viewmodel.dart';

class SubmitButtonBar extends StatelessWidget {
  final VoidCallback onSubmit;
  final bool canShowSubmit;
  const SubmitButtonBar({
    Key key,
    @required this.onSubmit,
    @required this.canShowSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _quizViewModel = Get.find<QuizViewModel>();
    const _navigateDuration = Duration(milliseconds: 300);
    const _curve = Curves.decelerate;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageNavigationButton(
              onTap: () async =>
                  await _quizViewModel.pageController.previousPage(
                    duration: _navigateDuration,
                    curve: _curve,
                  ),
              iconData: Icons.keyboard_arrow_left_rounded),
          Expanded(
            child:
                canShowSubmit ? _SubmitButton(onSubmit: onSubmit) : Container(),
          ),
          _PageNavigationButton(
              onTap: () async => await _quizViewModel.pageController.nextPage(
                    duration: _navigateDuration,
                    curve: _curve,
                  ),
              iconData: Icons.keyboard_arrow_right_rounded)
        ],
      ),
    );
  }
}

class _PageNavigationButton extends StatelessWidget {
  const _PageNavigationButton({
    Key key,
    @required VoidCallback onTap,
    @required IconData iconData,
  })  : _onTap = onTap,
        _iconData = iconData,
        super(key: key);

  final VoidCallback _onTap;
  final IconData _iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: IconButton(
        splashRadius: 0.1,
        padding: const EdgeInsets.only(top: 5),
        icon: Icon(
          _iconData,
          size: 45,
        ),
        onPressed: _onTap,
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;
  const _SubmitButton({
    Key key,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _borderRadius = Radius.circular(15);
    return RaisedButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(_borderRadius),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      onPressed: onSubmit,
      child: Text('SUBMIT', style: Theme.of(context).textTheme.button),
      color: Theme.of(context).accentColor,
    );
  }
}

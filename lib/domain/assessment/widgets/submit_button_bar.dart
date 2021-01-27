import 'package:flutter/material.dart';

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
    const _iconPadding = EdgeInsets.all(15);
    const _iconSize = 30.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
              padding: _iconPadding,
              icon: const Icon(
                Icons.keyboard_arrow_left_rounded,
                size: _iconSize,
              ),
              onPressed: () {}),
          canShowSubmit
              ? Expanded(child: _SubmitButton(onSubmit: onSubmit))
              : const SizedBox.shrink(),
          IconButton(
              padding: _iconPadding,
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: _iconSize,
              ),
              onPressed: () {})
        ],
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

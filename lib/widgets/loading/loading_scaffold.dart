import 'package:flutter/material.dart';
import 'loading.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Loading(),
    );
  }
}

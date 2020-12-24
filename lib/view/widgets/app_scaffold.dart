import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          alignment: Alignment.center,
          icon: Icon(
            Icons.menu,
            color: Colors.blue,
            size: 40,
          ),
          onPressed: () => print('menu'),
        ),
        actions: [],
        elevation: 0,
        title: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/logo.png',
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
        actionsIconTheme: IconThemeData(),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}

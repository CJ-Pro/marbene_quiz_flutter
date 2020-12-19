import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/services/authentication_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authService = Get.find<AuthenticationService>();

    return Scaffold(
      body: Center(
        child: IconButton(
          iconSize: 42,
          icon: Icon(Icons.logout),
          onPressed: () => authService.signOut(),
        ),
      ),
    );
  }
}

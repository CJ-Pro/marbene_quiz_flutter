import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/services/authentication_service.dart';
import 'widgets/home_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authService = Get.find<AuthenticationService>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              child: Image.asset(
                'assets/logo.png',
                height: 50,
              ),
              tag: 'logo',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(5, (index) => HomeTab()),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: authService.signOut,
            ),
          ],
        ),
      ),
    );
  }
}

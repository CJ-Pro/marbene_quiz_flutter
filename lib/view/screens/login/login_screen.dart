import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'widgets/free_test_button.dart';
import '../home/home_screen.dart';
import '../../../model/services/authentication_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authService = Get.find<AuthenticationService>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            FreeTestButton(),
            Expanded(
              child: FlutterLogin(
                onSignup: (input) => authService.registerWithEmailAndPassword(
                    email: input.name, password: input.password),
                onLogin: (input) => authService.signInWithEmailAndPassword(
                    email: input.name, password: input.password),
                onRecoverPassword: null,
                onSubmitAnimationCompleted: () => Get.offAll(HomeScreen()),
                logo: "assets/logo.png",
                logoTag: 'logo',
                title: "BY MARBENE",
                messages: LoginMessages(
                  recoverPasswordDescription:
                      "You will receive an email to reset your password.",
                ),
                theme: LoginTheme(
                  titleStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  pageColorDark: Colors.white,
                  pageColorLight: Colors.white,
                  primaryColor: Colors.lightBlue,
                  accentColor: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

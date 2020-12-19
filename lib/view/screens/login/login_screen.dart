import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import '../../../model/services/authentication_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authService = Get.find<AuthenticationService>();
    return FlutterLogin(
      onSignup: (input) => authService.registerWithEmailAndPassword(
          email: input.name, password: input.password),
      onLogin: (input) => authService.signInWithEmailAndPassword(
          email: input.name, password: input.password),
      onRecoverPassword: null,
      onSubmitAnimationCompleted: () => print('ss'),
      title: "BY MARBENE",
      theme: LoginTheme(
        titleStyle: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

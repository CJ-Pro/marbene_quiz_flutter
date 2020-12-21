import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import '../home/home_screen.dart';
import '../../../model/services/authentication_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authService = Get.find<AuthenticationService>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                  primaryColor: Colors.blue,
                  accentColor: Colors.blue,
                ),
              ),
            ),
            Container(
              height: 0.05 * Get.height,
              child: FlatButton(
                onPressed: () => print('object'),
                color: Colors.blue,
                child: Text(
                  'Try Free Test',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

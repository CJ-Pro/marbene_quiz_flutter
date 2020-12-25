import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:marbene/view/screens/home/home_screen.dart';
import 'package:marbene/view/screens/login/login_screen.dart';
import 'services/authentication_service.dart';
import 'repository/question_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut(() => AuthenticationService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authService = Get.find<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Marbene',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: authService.user == null
            ? LoginScreen()
            : HomeScreen() //authService.user == null ? LoginScreen() : HomeScreen(),
        );
  }
}

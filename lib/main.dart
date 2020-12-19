import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:marbene/view/screens/home/home_screen.dart';
import 'package:marbene/view/screens/login/login_screen.dart';
import 'model/services/authentication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authService = Get.put(AuthenticationService());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marbene',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Obx(
        () => authService.user == null ? LoginScreen() : HomeScreen(),
      ),
    );
  }
}

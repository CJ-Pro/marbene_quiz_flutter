import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:marbene/services/database_service.dart';
import 'services/authentication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut(() => AuthenticationService());
  Get.lazyPut(() => DatabaseService());
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
            ? Container()
            : Container() //authService.user == null ? LoginScreen() : HomeScreen(),
        );
  }
}

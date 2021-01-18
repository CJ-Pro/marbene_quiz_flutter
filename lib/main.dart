import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'domain/quiz/model/quiz.dart';
import 'domain/quiz/pages/start_quiz/start_quiz_page.dart';
import 'domain/quiz/viewmodel/quiz_viewmodel.dart';
import 'services/authentication_service.dart';
import 'services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get..lazyPut(() => AuthenticationService())..lazyPut(() => DatabaseService());
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
          ? Container(
              color: Colors.red,
            )
          : Container(),
    );
  }
}

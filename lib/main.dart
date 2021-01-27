import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import 'constants/theme/text_theme.dart';
import 'domain/quiz/pages/previous_quiz/previous_quiz_page.dart';
import 'services/authentication_service.dart';
import 'services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: defaultTextTheme,
      ),
      home: authService.user == null
          ? Container(
              color: Colors.red,
            )
          : const PreviousQuizPage(),
    );
  }
}

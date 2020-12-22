import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marbene/view/screens/home/widgets/home_tab.dart';
import '../../../model/services/authentication_service.dart';
import '../../widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      imageSource: 'assets/logo.png',
      body: ListView(
        children: [
          {"title": "Previous Tests", "onPressed": () => print('p')},
          {"title": "Create Test", "onPressed": () => print('c')},
          {"title": "Past Questions", "onPressed": () => print('pa')},
          {"title": "Mock", "onPressed": () => print('m')},
          {
            "title": "Logout",
            "onPressed": () => Get.find<AuthenticationService>().signOut()
          }
        ]
            .map(
              (e) => HomeTab(
                title: e['title'],
                onPressed: e['onPressed'],
              ),
            )
            .toList(),
      ),
    );
  }
}

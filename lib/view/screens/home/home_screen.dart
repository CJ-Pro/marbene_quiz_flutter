import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/home_tab.dart';
import '../../../model/services/authentication_service.dart';
import '../../widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ListView(
        children: <Map<String, dynamic>>[
          {
            "title": "Custom",
            "onPressed": null,
          },
          {
            "title": "Multiple Choice",
            "onPressed": null,
          },
          {
            "title": "Picture Test",
            "onPressed": null,
          },
          {
            "title": "Theory",
            "onPressed": null,
          },
          {
            "title": "Mock",
            "onPressed": null,
          },
          {
            "title": "Logout",
            "onPressed": () => Get.find<AuthenticationService>().signOut(),
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

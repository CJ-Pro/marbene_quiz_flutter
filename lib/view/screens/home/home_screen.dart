import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/multiple_choice/multiple_choice_screen.dart';
import '../../widgets/tab.dart';
import '../../../services/authentication_service.dart';
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
            "onPressed": () => Get.to(MultipleChoiceScreen()),
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
              (e) => TabWidget(
                title: e['title'],
                onPressed: e['onPressed'],
              ),
            )
            .toList(),
      ),
    );
  }
}

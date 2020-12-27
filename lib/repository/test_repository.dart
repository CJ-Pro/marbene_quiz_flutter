import 'package:get/get.dart';
import 'package:marbene/services/database_service.dart';
import '../model/test.dart';
import '../services/authentication_service.dart';

class TestRepository {
  final _reference = Get.find<DatabaseService>().ref;

  Future<void> getOrCreateUserTest(String id) async {
    var userId = Get.find<AuthenticationService>().user.uid;
    var userTestRef = _reference.child("flamelink/tests/$userId/$id/");
    userTestRef.keepSynced(true);
    var userTestSnaphost = await userTestRef.once();

    if (userTestSnaphost.value == null) {
      await userTestRef.set(Test(
        answeredTotal: 0,
        correctTotal: 0,
        id: id,
        currentQuestion: 0,
        questions: [],
      ).toMap());
      userTestSnaphost = await userTestRef.once();
    }

    return Test.fromMap(Map<String, dynamic>.from(userTestSnaphost.value));
  }
}

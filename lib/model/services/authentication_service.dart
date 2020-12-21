import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../view/screens/login/login_screen.dart';

class AuthenticationService extends GetxService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();

  @override
  onInit() {
    super.onInit();
    _user.bindStream(_auth.idTokenChanges());
  }

  User get user => _user.value;

  Future<String> registerWithEmailAndPassword(
      {String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      print(e);
      return e.toString();
    }
    return null;
  }

  Future<String> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }

      return e.message;
    } catch (e) {
      print(e);
      return e.toString();
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    } finally {
      Get.offAll(LoginScreen());
    }
  }
}

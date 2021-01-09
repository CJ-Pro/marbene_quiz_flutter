import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../exceptions/authentication_exception.dart';

class AuthenticationService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User> _user = Rx<User>();

  @override
  onInit() {
    super.onInit();
    _user.bindStream(_auth.idTokenChanges());
  }

  User get user => _user.value;

  Future<void> registerWithEmailAndPassword(
      {String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationException(
            'The account already exists for that email.');
      }
      throw AuthenticationException(e.message);
    } on SocketException {
      throw AuthenticationException('No Internet Connection.');
    }
  }

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationException('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationException('Wrong password provided for that user.');
      }
      throw AuthenticationException(e.message);
    } on SocketException {
      throw AuthenticationException('No Internet Connection.');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on SocketException {
      throw AuthenticationException('No Internet Connection.');
    }
  }
}

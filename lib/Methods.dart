import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      if (kDebugMode) {
        print("Login Successful");
      }
      return user;
    } else {
      if (kDebugMode) {
        print("Account creation failed");
      }
      return user;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      if (kDebugMode) {
        print("Login Sucessfull");
      }
      return user;
    } else {
      if (kDebugMode) {
        print("Login Failed");
      }
      return user;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

Future logOut() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut();
  } catch (e) {
    if (kDebugMode) {
      print("Error");
    }
  }
}

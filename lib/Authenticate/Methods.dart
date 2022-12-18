import 'package:chat_app/Authenticate/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  try {
    User? user = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      if (kDebugMode) {
        print("Account created Successful");

        user.updateDisplayName(name);

        await firebaseFirestore.collection('users').doc(auth.currentUser?.uid).set({
          "name":name,
          "email":email,
          "status":"Unavaliable",
          "uid":auth.currentUser!.uid,
        });
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
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    User? user = (await auth.signInWithEmailAndPassword(
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

Future logOut(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  } catch (e) {
    if (kDebugMode) {
      print("Error");
    }
  }
}

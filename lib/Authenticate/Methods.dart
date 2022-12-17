import 'package:chat_app/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      if (kDebugMode) {
        print("Account created Successful");

        user.updateDisplayName(name);

        await _firebaseFirestore.collection('users').doc(_auth.currentUser?.uid).set({
          "name":name,
          "email":email,
          "status":"Unavaliable",
          "uid":_auth.currentUser!.uid,
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

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  } catch (e) {
    if (kDebugMode) {
      print("Error");
    }
  }
}

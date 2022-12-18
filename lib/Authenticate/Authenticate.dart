import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:chat_app/Authenticate/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return  const HomeScreen();
    } else {
      return  const LoginScreen();
    }
  }
}

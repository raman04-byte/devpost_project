import 'package:chat_app/Authenticate/Authenticate.dart';
import 'package:chat_app/Authenticate/LoginScreen.dart';
import 'package:chat_app/cred/imp2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Authenticate/Authenticate.dart';
Imp imp = Imp();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: imp.apiK,
          appId: imp.appI,
          messagingSenderId: imp.mess,
          projectId: imp.pId));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}

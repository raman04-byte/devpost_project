import 'package:chat_app/Authenticate/CreateAccount.dart';
import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:chat_app/Authenticate/Methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: isLoading
          ? Center(
              child: SizedBox(
                height: size.height / 20,
                width: size.height / 20,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    width: size.width / 1.2,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios))),
                SizedBox(
                  height: size.height / 50,
                ),
                SizedBox(
                  width: size.width / 1.3,
                  child: const Text(
                    "Hello again",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: size.width / 1.3,
                  child: const Text(
                    "You have been missed!",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "Email", Icons.account_box, _email)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child:
                        field(size, "Password", Icons.lock_outlined, _password),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                customButton(size),
                SizedBox(
                  height: size.height / 20,
                ),
                GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CreateAccount())),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ))
              ]),
            ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });
          logIn(_email.text, _password.text).then((value) {
            if (value != null) {
              if (kDebugMode) {
                print("Login  Successful");
              }
              setState(() {
                isLoading = false;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            } else {
              if (kDebugMode) {
                print("Login falied");
              }
              isLoading = false;
            }
          });
        } else {
          if (kDebugMode) {
            print("Fill the form correctly");
          }
        }
      },
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        alignment: Alignment.center,
        child: const Text("Login",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return SizedBox(
      height: size.height / 15,
      width: size.width / 1.1,
      child: TextField(
        
        controller: cont,
        cursorColor: Colors.black,

        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

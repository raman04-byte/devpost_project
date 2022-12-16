import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _name=TextEditingController();
    final TextEditingController _email=TextEditingController();
    final TextEditingController _password=TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
              alignment: Alignment.centerLeft,
              width: size.width / 1.2,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_ios))),
          SizedBox(
            height: size.height / 50,
          ),
          Container(
            width: size.width / 1.3,
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: size.width / 1.3,
            child: Text(
              "Create Account to continue!",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "Name", Icons.account_box,_name)),
          ),
          Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "Email", Icons.account_box,_email)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "Password", Icons.lock_outlined,_password),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          customButton(size),
          GestureDetector(
            onTap:()=>Navigator.pop(context),
              child: Text(
            "Login",
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
          ))
        ]),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap:(){},
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        alignment: Alignment.center,
        child: Text("Create Account",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget field(Size size, String hintText, IconData icon,TextEditingController cont) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

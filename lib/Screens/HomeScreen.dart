import 'package:chat_app/Authenticate/Methods.dart';
import 'package:chat_app/Colors.dart';
import 'package:chat_app/Screens/ChatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      if (kDebugMode) {
        print(userMap);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: '#333333'.toColor(),
        appBar: AppBar(
          title: const Text("Home Screen"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => logOut(context),
            )
          ],
        ),
        body: isLoading
            ? Center(
                child: Container(
                  height: size.height / 20,
                  width: size.width / 20,
                  child: const CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    height: size.height / 14,
                    width: size.width,
                    alignment: Alignment.center,
                    child: Container(
                      height: size.height / 14,
                      width: size.width / 1.15,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _search,
                        decoration: InputDecoration(
                          
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  ElevatedButton(onPressed: onSearch, child: Text("Search")),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  userMap != null
                      ? ListTile(
                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatRoom())),
                          leading: const Icon(
                            Icons.account_box,
                            color: Colors.black,
                          ),
                          title: Text(
                            userMap!['name'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(userMap!['email']),
                          trailing: const Icon(
                            Icons.chat,
                            color: Colors.black,
                          ),
                        )
                      : Container()
                ],
              ));
  }
}

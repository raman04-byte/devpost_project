import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  
    Map<String, dynamic>? userMap;
    final String? chatRoomId;
    ChatRoom({this.chatRoomId, this.userMap});
    final TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Name"),
      ),
      body: Container(),
      bottomNavigationBar: Container(
        height: size.height / 10,
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          height: size.height / 12,
          width: size.width / 1.1,
          child: Row(
            children: [
              Container(
                height: size.height / 1.5,
                width: size.width / 1.5,
                child: TextField(
                  controller: _message,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send_rounded))
            ],
          ),
        ),
      ),
    );
  }
}

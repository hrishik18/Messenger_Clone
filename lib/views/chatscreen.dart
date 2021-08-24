import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatWithUser,name ;
  ChatScreen(this.chatWithUser,this.name)
  //const ChatScreen({Key? key}) : super(key: key);
  
  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

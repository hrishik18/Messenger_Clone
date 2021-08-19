import 'package:chat_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messenger Clone"),
        actions: [
          InkWell(
            onTap: () {
              AuthMethods().signOut().then((s) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SignIn() ))
                )//then
              
            });
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)
                ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [Expanded(child: TextField(decoration: 
              InpputDecoration(border:InputBorder.none,hintText:"username",
              
              )): TextField()),Icon(Icons.search)],
            )
          ],
        ),
      ),
    );
  }
}

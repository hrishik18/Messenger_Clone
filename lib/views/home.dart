import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearching = false;
  TextEditingController searchUsernameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messenger Clone"),
        actions: [
          InkWell(
            onTap: () {
              AuthMethods().signOut().then((s) {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SignIn() ));
                Get.to(SignIn());
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            isSearching
                ? GestureDetector(
                    onTap: () {
                      isSearching = false;
                      searchUsernameEditingController.text = "";
                      setState(() {});
                    },
                    child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(Icons.arrow_back)),
                  )
                : Container(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black87,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Container(
                      child: Expanded(
                          child: TextField(
                        controller: searchUsernameEditingController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "username"),
                      )),
                    ),
                    GestureDetector(
                        onTap: () {
                          isSearching = !isSearching;
                          setState(() {});
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

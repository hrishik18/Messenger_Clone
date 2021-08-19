import 'package:chat_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messenger Clone"),
      ),
      body: GestureDetector(
        onTap: () {
          AuthMethods().signInWithGoogle(context);
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color(0xffDB4437),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Text("Sign In with Google"),
          ),
        ),
      ),
    );
  }
}

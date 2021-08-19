import 'package:chat_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result =
        await _firebaseAuth.signInWithCredential(credential);
    User userDetails = result.user!;

    SharedPreferenceHelper().saveUserEmail(userDetails.email);
    SharedPreferenceHelper().saveUserId(userDetails.uid);
    SharedPreferenceHelper().saveDisplayName(userDetails.displayName);
    SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL);

    Map<String, dynamic> userInfo = {
      "email": userDetails.email,
      "username": userDetails.email!.replaceAll("@gmail.com", ""),
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL
    };
    DatabaseMethods().addUserInfoToDB(userDetails.uid, userInfo).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  Future signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    auth.signOut;
  }
}

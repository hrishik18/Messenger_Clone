import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final String chatWithUser,name ;
  ChatScreen(this.chatWithUser,this.name)
  //const ChatScreen({Key? key}) : super(key: key);
  
  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  late String chatRoomId,messageId="";
  late String myName,myProfilePic,myUserName,myEmail;

  grtMyInfoFromSP() async{
    myName= await SharedPreferencesHelper().getDisplayName();
    myProfilePic = await SharedPreferencesHelper().getUserProfileUrl();
    myUserName=await SharedPreferencesHelper().getUserName();
    myEmail=await SharedPreferencesHelper().getUserEmail();

    chatRoomId=getchatid(widget.chatWithUser,myUserName);
    }
    getchatid(String a,String b){
      if(a.substring(0,1).codeUnitAt(0)>b.substring(0,1).codeUnitAt(0))
      return "$b\_$a";
      else
      return "$a/$b";
    }
    getandsetMessage()async{


    }
    dothisonlaunch() async{
       await  getInfoFromSharedPrefrences();
       getandsetMessage();
    }
  @override
  void initState(){
    dothisonlaunch();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Container(
        child: Stack(
          children: [
               Container(
                 alignment: Alignment.bottomCenter,
                 child: Container(
                   color: Colors.black.withOpacity(0.8),
                   padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                 child: Row(
                 children: [Expanded(child:TextField(
                   style: TextStyle(color: Colors.white),
                   decoration:InputDecoration(
                   border: InputBorder.none,
                   hintText: "Type here",
                   //hintStyle: TextStyle(fontWeight: FontWeight.w500)
                 ),
                 )
                 ),Icon(
                   Icons.send,
                   color: Colors.white,
                   )],
                  ),
                 ),
               )
          ],
        ),
      ),
    );
  }
}

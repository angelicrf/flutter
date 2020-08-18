import 'package:chatUI/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen  extends StatefulWidget {

  final User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
    appBar: AppBar(title: Text(widget.user.name, style: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),),
    elevation: 0.0,
    actions: [
      IconButton(
        icon: Icon(Icons.more_horiz),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {},
      )
    ],),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
          )
        ),
      ),
    );
  }
}

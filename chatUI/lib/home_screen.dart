import 'dart:ui';
import 'package:chatUI/Auth/sign_in.dart';
import 'package:chatUI/category_selector.dart';
import 'package:chatUI/favorites_contacts.dart';
import 'package:chatUI/recent_chats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Auth/sign_in.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {  },
        ),
        title: Text(
          'Chat',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Container(
            height: 500.0,
            //margin: EdgeInsets.only(bottom: 25.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255,233,227,227),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
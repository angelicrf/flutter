import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child: ListView(
       padding: EdgeInsets.symmetric(vertical: 30.0),
       children: [
         Padding(
           padding: const EdgeInsets.only(left: 15.0, right: 120.0),
           child: Text("What would you like to see?", style: TextStyle(
             fontSize: 30.0,
             fontWeight: FontWeight.bold,
           ),),
         ),

       ],
     ),),
    );
  }
}

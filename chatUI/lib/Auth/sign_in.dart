import 'package:chatUI/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chat_screen.dart';
import '../message_model.dart';
import 'auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      child: Container(
        color: Colors.deepPurpleAccent,
        //margin: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        height: 80,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),

        child:
          PageView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index){
            return  Column(
              children: [
                RaisedButton(
                  child: Text("SignIn Anonymously"),
                  onPressed: () async{
                    final Message chat = chats[index];
                    AuthService ath = AuthService();
                    await ath.signinAnon();
                    Navigator.push(context, MaterialPageRoute(builder: (_) =>
                        HomeScreen()));
                  },
                ),
                RaisedButton(
                child: Text("SignIn with email-password"),
                onPressed: () async{
                final Message chat = chats[index];
                AuthService ath = AuthService();
                await ath.sgininEmail();
                Navigator.push(context, MaterialPageRoute(builder: (_) =>
                HomeScreen()));
                },
                )
              ],
            );
          }),
        ),
      );
  }
}

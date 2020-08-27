//import 'package:chatUI/get_firestore_data.dart';
import 'package:chatUI/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../message_model.dart';
import 'auth.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    final myController_2 = TextEditingController();
    Message showMs = new Message();
    showMs.getUserInfo();

    return GestureDetector(
          child: Container(
        color: Colors.deepPurpleAccent,
        //margin: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        height: 80,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child:
          PageView.builder(
              itemCount: chatsList.length,
              itemBuilder: (BuildContext context, int index){
            return  Scaffold(
              backgroundColor: Colors.greenAccent,
              body: Column(
                children: [
                  RaisedButton(
                    child: Text("SignIn Anonymously"),
                    onPressed: () async{
                      //Message showMs = new Message();

                      AuthService ath = AuthService(myController.toString(),myController_2.text.toString(),[]);
                      await ath.signinAnon();
                      //await ath.getData();
                      Navigator.push(context, MaterialPageRoute(builder: (_) =>
                          HomeScreen()));
                    },
                  ),
                  TextFormField(
                  decoration: InputDecoration(
                  labelText: 'Enter your username'
                  ),
                    controller: myController,
                  ),
                  TextFormField(
                  decoration: InputDecoration(
                  labelText: 'Enter your password'
                  ),
                    controller: myController_2,
                  ),
                  RaisedButton(
                  child: Text("SignIn with email-password"),
                  onPressed: () async{
                  final Message chat = chatsList[index];
                  AuthService ath = AuthService(myController.text.toString(), myController_2.text.toString(),[]);
                  await ath.sgininEmail();
                  Navigator.push(context, MaterialPageRoute(builder: (_) =>
                  HomeScreen()));
                  },
                  )
                ],
              ),
            );
          }),
        ),
      );
  }
}

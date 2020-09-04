import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import './sign_in.dart';

class LoginUser extends StatefulWidget {
  @override
  _LoginUser createState() => _LoginUser();
}

class _LoginUser extends State<LoginUser> {
  SignIn _signIn = new SignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Padding(
        padding: const EdgeInsets.only(left: 140.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SignIn",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            RaisedButton(
                color: Colors.red,
                child: Text(
                  "SignIn Anonymously",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  await _signIn.receiveImages("destinations");
                  await _signIn.receiveImages("hotels");
                  //_signIn.createCollectionList();
                  //_signIn.createCollection();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                })
          ],
        ),
      ),
    );
  }
}

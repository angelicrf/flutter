//import 'package:chatUI/get_firestore_data.dart';

import 'dart:convert';
import 'dart:io';

import 'package:chatUI/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../message_model.dart';
import 'auth.dart';

class SignIn extends StatefulWidget {
  final _picker = ImagePicker();
  var pickedFile;
  File file = File("");
  var displayImage;

  SignIn({this.file});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
AuthService authService = new AuthService();
Message message = new Message();

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    final myController_2 = TextEditingController();
    Message showMs = new Message();
    showMs.getUserInfo();
    
   Future getImage() async{
      widget.pickedFile = await widget._picker.getImage(source: ImageSource.gallery);
      widget.file = File(widget.pickedFile.path);
        setState(() {
        base64Encode(widget.file.readAsBytesSync());
        widget.file = File(widget.pickedFile.path);
        authServ.imageValue = widget.file;
        message.storeImage = widget.file;
        //print(base64Encode(file.readAsBytesSync()));
        print("Image is uploaded");
        print(message.storeImage);
      });
      return authService.imageValue;
    };

    return GestureDetector(
          child: Container(
        color: Colors.deepPurpleAccent,
        //margin: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        height: 80,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child:
          PageView.builder(
              itemCount: 7,
              itemBuilder: (BuildContext context, int index){
            return  Scaffold(
              backgroundColor: Colors.greenAccent,
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: SizedBox(
                            width: 90.0,
                            height: 90.0,
                            child: (widget.file != null) ?
                            Image.file(widget.file, fit: BoxFit.fill,)
                                : Image.network(
                              "https://www.gstatic.com/webp/gallery3/5_webp_a.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                            icon: FaIcon(FontAwesomeIcons.camera),
                          iconSize: 30.0,
                          onPressed: ()  async {
                              widget.displayImage = await getImage();
                              print("icon has clicked...");
                          },
                      ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text("SignIn Anonymously"),
                    onPressed: () async{
                      AuthService ath = AuthService();
                         ath.userName = myController.toString();
                         ath.password = myController_2.text.toString();
                      await ath.signinAnon();
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
                  AuthService ath = AuthService();
                     ath.userName = myController.text.toString();
                     ath.password = myController_2.text.toString();
                  await ath.sgininEmail(message.storeImage);
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

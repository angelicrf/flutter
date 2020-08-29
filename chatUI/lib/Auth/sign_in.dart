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
  File file_2;
  SignIn(File file2){
    this.file_2 = file2;
    print("from the signin constructor $file_2");
  }
  @override
  _SignInState createState() => _SignInState(file_2);
}

class _SignInState extends State<SignIn> {

  final _picker = ImagePicker();
  File file;
  var pickedFile;

  _SignInState(File _file){
    this.file = _file;
  }

  @override
  void initState() {
    super.initState();
    file = widget.file_2;
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    final myController_2 = TextEditingController();
    Message showMs = new Message();
    showMs.getUserInfo();
    
   Future getImage() async{
      pickedFile = await _picker.getImage(source: ImageSource.gallery);
      file = File(pickedFile.path);
      widget.file_2 = file;
        setState(() {
        base64Encode(file.readAsBytesSync());
        //print(base64Encode(file.readAsBytesSync()));
        widget.file_2 = file;
        print("Image is uploaded");
      });
      SignIn signIn = new SignIn(file);
      print("SigninFile2 is");
      print(signIn.file_2);
      return signIn.file_2;
    }

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
                            child: (file != null) ?
                            Image.file(file, fit: BoxFit.fill,)
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
                              await getImage();
                              print("icon has clicked...");
                          },
                      ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text("SignIn Anonymously"),
                    onPressed: () async{
                      AuthService ath = AuthService(
                          myController.toString(),
                          myController_2.text.toString(),
                          []);
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
                  AuthService ath = AuthService(
                      myController.text.toString(),
                      myController_2.text.toString()
                      ,[]);
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

import 'dart:convert';
import 'dart:io';
import 'package:chatUI/Auth/sign_in.dart';
import 'package:chatUI/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthService{

  var userName;
  var password;
  var existUser2 = [];
  List<String> showImage2 = new List();
  var imageValue;
  Map testValue3 = new Map();

  AuthService({String userName, String password,
    List<String> existUser2, this.imageValue, this.testValue3});
  Message message = new Message();

  FirebaseAuth auth = FirebaseAuth.instance;

   Future getData()async{
     showImage2.clear();
     existUser2.clear();
      //testValue3.clear();

      await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) => {
          /*for (int i = 0; i < querySnapshot.docs.length; i++) {
             this.testValue = querySnapshot.docs[i].data(),

          }*/
          querySnapshot.docs.forEach((doc) {
             this.showImage2.add(jsonEncode(doc.data()["image"]));
              this.existUser2.add(jsonEncode(doc.data()["name"]));
             this.testValue3 =
                 {"a": this.showImage2.toList(),
                  "b": this.existUser2.toList()
                 };
              if(this.showImage2.length > 0){
                return showImage2;
              }
              if(this.existUser2.length > 0 ){
                return existUser2;
              }
           })
        });
      print("testvalue check");
     print(this.testValue3);
     return this.testValue3;
    }
  Future registerUser(var registerImage){
    try{
      FirebaseFirestore.instance.collection('users').add(
          {
            "name" : this.userName,
            "password" : this.password,
            "address" : {
              "street" : "default",
              "city" : "default"
            },
            "image" : registerImage.toString()
          }).then((value){
       return value;
      });
    }on FirebaseFirestore
    catch(e){
      print(e.toString());
    }
  }
  Future sgininEmail(var holdImage) async{
     var dt = await getData();
   if(existUser2.contains("anna.holmes@gmail.com")) {
     try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "anna.holmes@gmail.com",
          password: "123456"
      );
      if(user != null){
        return print("authenticated user... $user");
      }
      else
      return print("not a authenticated user");
      //return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return print('Wrong password provided for that user.');
      }
      else return print(e.toString());
    }} else
      return registerUser(holdImage);
  }
  Future signinAnon() async {
    try{
      var dt = await getData();
       UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
       print(userCredential);
       if(userCredential != null) {
         return print(userCredential);
       }
      else return ("not a credentialed user ...");

    }catch(e){
       return print(e.toString());
    }
  }
}
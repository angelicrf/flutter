//import 'dart:html';

import 'dart:io';

import 'package:chatUI/Auth/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  var userName;
  var password;
  List<String> existUser2 = new List();
  File file;

  AuthService(String userName, String password, List<String> existUser2){
    this.userName = userName;
    this.password = password;
    this.existUser2 = existUser2;
  }

  FirebaseAuth auth = FirebaseAuth.instance;

   Future<List<String>> getData()async{
     List<String> existUser = new List();
     var showImage = "";
      await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {

            showImage = doc.data()["image"];
            existUser.add(doc.data()["name"]);
            return existUser;
           })
        });
      this.existUser2 = existUser;
      this.file = showImage as File;
       //print("Show Image is $showImage");
      return existUser2;
    }
  Future registerUser(){
    try{
     // var getSigned = signin.file_2;
     // this.file = getSigned;
     // print("getting from auth $file");
      FirebaseFirestore.instance.collection('users').add(
          {
            "name" : this.userName,
            "password" : this.password,
            "address" : {
              "street" : "default",
              "city" : "default"
            },
            "image" : this.file
          }).then((value){
       return value;
      });
    }on FirebaseFirestore
    catch(e){
      print(e.toString());
    }
  }
  Future sgininEmail() async{
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
      return registerUser();
  }
  Future signinAnon() async {
    try{
      SignIn signin = new SignIn(null);
      var getSigned = signin.file_2;
      this.file = getSigned;
      print("getting from auth is $getSigned");
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
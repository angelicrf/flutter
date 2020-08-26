//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  var userName;
  var password;
  List<String> existUser2 = new List();

  AuthService(String userName, String password){
    this.userName = userName;
    this.password = password;
   // getData();
    //print(getData());
  }
  FirebaseAuth auth = FirebaseAuth.instance;

   Future<List<String>> getData()async{
     List<String> existUser = new List();
      await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            existUser.add(doc.data()["name"]);
            return existUser;
           })
        });
      this.existUser2 = existUser;
     print("the value is $existUser");
      return existUser2;
    }
  Future registerUser(){
    try{
      FirebaseFirestore.instance.collection('users').add(
          {
            "name" : this.userName,
            "password" : this.password,
            "address" : {
              "street" : "default",
              "city" : "default"
            }
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
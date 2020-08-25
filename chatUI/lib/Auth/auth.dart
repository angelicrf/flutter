import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  var userName;
  var password;
  AuthService(String userName, String password){
    this.userName = userName;
    this.password = password;
  }
  FirebaseAuth auth = FirebaseAuth.instance;

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
       return print(value.toString());
      });
    }on FirebaseFirestore
    catch(e){
      print(e.toString());
    }
  }

  Future sgininEmail() async{
   if(this.userName == "anna.holmes@gmail.com") {
     try {
       //print(userName);
      //print(password);
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
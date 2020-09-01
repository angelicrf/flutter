import 'package:firebase_auth/firebase_auth.dart';

class SignIn {
SignIn();

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

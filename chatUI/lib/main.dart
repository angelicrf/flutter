import 'package:chatUI/Auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  //Future<FirebaseApp> _initialization =  Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return /*FutureBuilder(
      future: _initialization,
      builder:  (context, snapshot) {
      if (snapshot.hasError) {
        return _SomethingWentWrong();
      }
      // Once complete, show your application
      if (snapshot.connectionState == ConnectionState.done) {
        return (*/
      MaterialApp(
        title: "ChatUI",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.black26,
        ),
        home: SignIn(),
      );
    /*}
      // Otherwise, show something whilst waiting for initialization to complete
      return _Loading();
    },
      );*/
    /*   */
  }
   _SomethingWentWrong() {
   return print("Something is wrong");
  }

  _MyAwesomeApp() {
    return print("MyAwesomeApp");
  }
_Loading() {
  return print("Loading....");
}
}





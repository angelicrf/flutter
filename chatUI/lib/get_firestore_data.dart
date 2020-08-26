import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    print("here1");
     FutureBuilder<DocumentSnapshot>(

      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            print("here2");
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print("here3");
          print(snapshot.data);
         Map<String, dynamic> data;
        // data.addAll(snapshot.data);
          return Text("User name is : ${data['userName']} ${data['password']}");
        }

        return Text("loading...");
      },
    );

  }
  }
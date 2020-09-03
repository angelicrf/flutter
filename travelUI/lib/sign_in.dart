import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SignIn {
  List<String> listOfStr = List();
  List<String> listOfImage;

  SignIn({this.listOfImage});

  var storage = FirebaseStorage.instance;
  var firebaseFirestore = FirebaseFirestore.instance;

  Future signinAnon() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInAnonymously();
      print(userCredential);
      if (userCredential != null) {
        return print(userCredential);
      }
      else
        return ("not a credentialed user ...");
    } catch (e) {
      return print(e.toString());
    }
  }

   getImages() {
    this.listOfImage =  List();
    var holdImages = ["image_1", "image_2","image_3",
                      "image_4","image_5"];

    for (int i = 0; i < holdImages.length; i++) {
      listOfImage.add(holdImages[i]);
    }
    return listOfImage;
  }

  void saveStorage() {

    this.getImages();
    this.listOfImage.forEach((img) async {
     final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load('assets/images/'+ img + ".jpg");
      print(byteData);

      final file =
      File('${systemTempDir.path}/$img + jpg');
      await file.writeAsBytes(byteData.buffer.asUint8List(
          byteData.offsetInBytes, byteData.lengthInBytes));
      StorageTaskSnapshot snapshot = await storage
          .ref()
          .child("images/$img")
          .putFile(file)
          .onComplete;
      if (snapshot.error == null) {
        final String downloadUrl =
        await snapshot.ref.getDownloadURL();
        await firebaseFirestore
            .collection("destinations")
            .add({"url": downloadUrl, "name": img});
      }
    });
  }
  Future<QuerySnapshot> receiveImages() {
    return firebaseFirestore.collection("destinations").get();
  }

}

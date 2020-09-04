import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:travelUI/activity_model.dart';

class SignIn {
  List<String> listOfHotelImages;
  List<String> listOfImage;

  SignIn({this.listOfImage, this.listOfHotelImages});

  var storage = FirebaseStorage.instance;
  var firebaseFirestore = FirebaseFirestore.instance;

  Future signinAnon() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print(userCredential);
      if (userCredential != null) {
        return print(userCredential);
      } else
        return ("not a credentialed user ...");
    } catch (e) {
      return print(e.toString());
    }
  }

  getImages() {
    this.listOfImage = List();
    this.listOfHotelImages = List();
    var holdImages = ["image_1", "image_2", "image_3", "image_4", "image_5"];

    var holdHotelsImages = [
      "hotel_1",
      "hotel_2",
      "hotel_3",
      "hotel_4",
      "hotel_5"
    ];
    var defaultImage = "avatar.png";

    for (int i = 0; i < holdImages.length; i++) {
      listOfImage.add(holdImages[i]);
      listOfHotelImages.add(holdHotelsImages[i]);
    }
    if (listOfImage.length > 0) {
      return listOfImage;
    }
    if (listOfHotelImages.length > 0) {
      return listOfHotelImages;
    } else
      return defaultImage;
  }

  createCollectionList() {
    Activity activities = new Activity();

    try {
      FirebaseFirestore.instance.collection('activities').add({
        "imageUrl": "",
        "name": "Bahama",
        "type": "Swimming",
        "startTimes": ["12:30pm", "4:20pm"],
        "rating": 3,
        "price": 340,
      }).then((value) {
        return value;
      });
    } on FirebaseFirestore catch (e) {
      print(e.toString());
    }
  }

  void saveStorage(List<String> listEnter, String collectionName) {
    listEnter.forEach((img) async {
      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load('assets/images/' + img + ".jpg");
      print(byteData);

      final file = File('${systemTempDir.path}/$img + jpg');
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      StorageTaskSnapshot snapshot =
          await storage.ref().child("images/$img").putFile(file).onComplete;
      if (snapshot.error == null) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        await firebaseFirestore
            .collection(collectionName)
            .add({"url": downloadUrl, "name": img});
      }
    });
  }

  createCollection() {
    getImages();
    return saveStorage(this.listOfHotelImages, "hotels");
  }

  Future<QuerySnapshot> receiveImages(String collectionName) {
    return firebaseFirestore.collection(collectionName).get();
  }
}

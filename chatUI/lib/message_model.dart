import 'dart:core';
import 'dart:io';
import 'package:chatUI/Auth/auth.dart';
import 'package:chatUI/user_model.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

AuthService authServ = new AuthService();
User currentUsr;
Message message;
List<User> favoriteList = new List();
List<Message> chatsList = new List();

class Message {

  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  var storeImage;

  Message({
    this.isLiked,
    this.sender,
    this.text,
    this.time,
    this.unread,
    this.storeImage
  });

  var modified;
  File img;
  File alternativeImg;

  getUserInfo() async {
    await authServ.getData();
    Random random = new Random();

    authServ.testValue3.forEach((key, value) =>
    {
      if(key == "a"){
        for(int i = 0; i < value.length; i++){

          modified = value[i].substring(8, value[i].length - 2),
          img = File(modified.toString()),
          alternativeImg =
              File(
                  "/data/user/0/com.example.chatUI/cache/image_picker8022641881933704740.jpg"),

          currentUsr = User(
            id: random.nextInt(100),
            name: authServ.existUser2[i],
            imageUrl: (value[i] != null) ? img : alternativeImg,
          ),
          favoriteList.add(currentUsr),
          message = Message(
            sender: currentUsr,
            time: '4:30 PM',
            text: "Hey how\'s your new job?",
            isLiked: true,
            unread: true,
          ),
          chatsList.add(message),
          chatsList,
          print(value[i])
        }
      }
    }
    );
    // favoriteList.clear();
    // chatsList.clear();
    //authServ.showImage2.clear();
    //authServ.existUser2.clear();
  }
}
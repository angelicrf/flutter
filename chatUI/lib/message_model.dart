import 'dart:core';
import 'package:chatUI/Auth/auth.dart';
import 'package:chatUI/user_model.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';

AuthService authServ = new AuthService("", "",[]);
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

  Message({
    this.isLiked,
    this.sender,
    this.text,
    this.time,
    this.unread,
  });

  getUserInfo() async{
    await authServ.getData();
    Random random = new Random();
    favoriteList.clear();
    chatsList.clear();

    authServ.existUser2.forEach((element) {

      //storeElement.add(element);
      currentUsr = User(
        id: random.nextInt(100),
        name: element,
        imageUrl: "assets/images/user1.jpg",
      );
      favoriteList.add(currentUsr);
      message =  Message(
        sender: currentUsr,
        time: '4:30 PM',
        text: "Hey how\'s your new job?",
        isLiked: true,
        unread: true,
      );
      chatsList.add(message);
      return chatsList;
      //,sam, james, john, olivia, greg, sophia, steven;
    });


    print(chatsList.length);
    favoriteList.forEach((element) {print(element.id);});

  }

}

/*final User currentUser = User(
  id: 0,
  name: "Anna",
  imageUrl: "assets/images/user1.jpg",
);
final User greg = User(
  id: 1,
  name: "Greg",
  imageUrl: "assets/images/greg.jpg",
);
final User james = User(
  id: 2,
  name: "James",
  imageUrl: "assets/images/james.jpg",
);
final User john = User(
  id: 3,
  name: "John",
  imageUrl: "assets/images/john.jpg",
);
final User olivia = User(
  id: 4,
  name: "Olivia",
  imageUrl: "assets/images/olivia.jpg",
);
final User sam = User(
  id: 5,
  name: "Sam",
  imageUrl: "assets/images/sam.jpg",
);
final User sophia = User(
  id: 6,
  name: "Sophia",
  imageUrl: "assets/images/sophia.jpg",
);
final User steven = User(
  id: 7,
  name: "Steven",
  imageUrl: "assets/images/steven.jpg",
);*/

/*
List<Message> chats = [
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: "Hey how\'s your new job?",
    isLiked: true,
    unread: true,
  ),
  Message(
  sender: james,
  time: '5:30 PM',
  text: 'Hey how\'s your day?',
  isLiked: false,
  unread: false,
  ),
  Message(
    sender: sam,
    time: '6:30 PM',
    text: 'Hey how\'s your feeling?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '7:30 PM',
    text: 'Hey how\'s your appetite?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '8:30 PM',
    text: 'Hey how\'s your business?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: greg,
    time: '9:30 PM',
    text: 'Hey how\'s your boat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sophia,
    time: '10:30 PM',
    text: 'Hey how\'s your kids?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '11:30 PM',
    text: 'Hey how\'s your school?',
    isLiked: false,
    unread: true,
  ),
];*/

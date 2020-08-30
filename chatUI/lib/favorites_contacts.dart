import 'dart:io';
import 'dart:ui';
import 'package:chatUI/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Favorite Contacts", style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),),
                    IconButton(
                      icon: Icon(Icons.more_horiz,
                      ),
                      iconSize: 20.0,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                  height: 120.0,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 10.0),
                      itemCount: favoriteList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) =>
                              ChatScreen(user: favoriteList[index]))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  child: ClipOval(
                                    child: SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child:
                                      Image.file(favoriteList[index].imageUrl,fit: BoxFit.fill,)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.0),
                                Text(favoriteList[index].name,
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600
                                  ),)
                              ],
                            ),
                          ),
                        );
                      }
                  ))
            ]),
      ),
    );
  }
}
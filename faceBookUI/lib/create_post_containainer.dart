import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceBookUI/models/user_model.dart';
import 'package:faceBookUI/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faceBookUI/data/data.dart';
import 'package:flutter/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  CreatePostContainer({@required this.currentUser});

  @override
  Widget build(BuildContext context) {
    //this.currentUser = _user;
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 14.0, 12.0, 19.0),
      color: Colors.orange,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: this.currentUser.imageUrl),
              SizedBox(width: 10.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What\'s in your mind?",
                  ),
                ),
              )
            ],
          ),
          Divider(
            height: 10.0,
            thickness: 4.5,
          ),
          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () => print("live..."),
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text("Live"),
                ),
                VerticalDivider(
                  width: 10.0,
                  color: Colors.pink,
                  thickness: 4.0,
                ),
                FlatButton.icon(
                  onPressed: () => print("PhotoLibrary..."),
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.pink,
                  ),
                  label: Text("photos"),
                ),
                VerticalDivider(
                  width: 10.0,
                  color: Colors.pink,
                  thickness: 4.0,
                ),
                FlatButton.icon(
                  onPressed: () => print("room..."),
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.green,
                  ),
                  label: Text("room"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:faceBookUI/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'config/palette.dart';
import 'models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onLineUsers;

  const Rooms({Key key, this.onLineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: Colors.red,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          itemCount: onLineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            final User _user = onLineUsers[index];
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ProfileAvatar(imageUrl: _user.imageUrl, isActive: true),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () => print("outlined button..."),
      color: Colors.yellowAccent,
      textColor: Colors.white,
      borderSide: BorderSide(width: 4.0, color: Colors.blueAccent),
      child: Row(children: [
        /* ShaderMask(
          shaderCallback: (rect) =>
              Palette.createRoomGradient.createShader(rect),
          child: Icon(Icons.video_call, size: 30.0, color: Colors.white),
        ),*/
        Icon(Icons.video_call, size: 30.0, color: Colors.purpleAccent),
        SizedBox(
          width: 2.0,
        ),
        Text("Create\n room")
      ]),
    );
  }
}

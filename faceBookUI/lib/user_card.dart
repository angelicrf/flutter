import 'package:faceBookUI/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          ProfileAvatar(
            imageUrl: user.imageUrl,
          ),
          SizedBox(
            width: 7.0,
          ),
          Text(
            user.name,
            style: TextStyle(fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceBookUI/config/palette.dart';
import 'package:faceBookUI/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      height: 600.0,
      color: Colors.grey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _postHeader(post: post),
                SizedBox(
                  height: 4.0,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 7.0,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(post.imageUrl), fit: BoxFit.cover),
                  ),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _postHeader extends StatelessWidget {
  final Post post;

  const _postHeader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.imageUrl),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeApp} 🌎',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 13.0,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => print(
                  "from post list....",
                ))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      color: Palette.facebookBlue, shape: BoxShape.circle),
                  child: Icon(
                    Icons.thumb_up,
                    size: 10.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Text(
                    '${post.likes}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Text(
                  '${post.comments} comments',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  '${post.shares} shares',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Divider(),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: _PostButton(
                    icon: Icon(
                      MdiIcons.thumbUpOutline,
                      color: Colors.grey[600],
                      size: 21.0,
                    ),
                    label: "Like",
                    ontap: () => print("liked it..."),
                  ),
                ),
                SizedBox(
                  width: 60.0,
                ),
                _PostButton(
                  icon: Icon(
                    MdiIcons.comment,
                    color: Colors.grey[600],
                    size: 21.0,
                  ),
                  label: "Comments",
                  ontap: () => print("Comment it..."),
                ),
                SizedBox(
                  width: 60.0,
                ),
                _PostButton(
                  icon: Icon(
                    MdiIcons.share,
                    color: Colors.grey[600],
                    size: 21.0,
                  ),
                  label: "Share",
                  ontap: () => print("shared it..."),
                ),
              ],
            )
          ],
        ));
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final Function ontap;
  final String label;

  const _PostButton(
      {Key key,
      @required this.icon,
      @required this.ontap,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 26.0,
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 5.0,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }
}

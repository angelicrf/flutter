import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceBookUI/profile_avatar.dart';
import 'package:faceBookUI/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'config/palette.dart';
import 'models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, @required this.currentUser, @required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.purpleAccent,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: _StoryCard(isAddStory: true, currentUser: currentUser),
              );
            }

            final Story story = stories[index - 1];
            return _StoryCard(story: story);
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard(
      {Key key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: CachedNetworkImage(
            width: 120.0,
            height: double.infinity,
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 110.0,
          height: double.infinity,
          decoration: BoxDecoration(
              //color: Colors.black,
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(20.0)),
        ),
        Positioned(
            top: 8.0,
            right: 8.0,
            child: isAddStory
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add),
                      iconSize: 30.0,
                      color: Palette.facebookBlue,
                      onPressed: () => print("add item..."),
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,
                  )),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Text(
            isAddStory ? "Add a note" : story.user.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

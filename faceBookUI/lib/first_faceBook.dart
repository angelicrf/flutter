import 'package:faceBookUI/config/palette.dart';
import 'screens.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/models.dart';
import 'widgets.dart';

class FirstFaceBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(),
          // work on it
          desktop: _HomeScreenDesktop(),
          // work on it
          tablet: _HomeScreenDesktop(),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            "facebook",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
              fontSize: 29.0,
              color: Palette.facebookBlue,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.00,
              onPressed: () => print("search"),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.00,
              onPressed: () => print("FaceBookMessenger"),
            ),
          ],
        ),
        SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser)),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onLineUsers: onLineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

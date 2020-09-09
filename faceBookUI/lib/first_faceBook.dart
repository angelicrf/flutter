import 'package:faceBookUI/config/palette.dart';
import 'screens.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/models.dart';
import 'widgets.dart';

class FirstFaceBook extends StatefulWidget {
  @override
  _FirstFaceBookState createState() => _FirstFaceBookState();
}

class _FirstFaceBookState extends State<FirstFaceBook> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          // work on it
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
          // work on it
          tablet:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({Key key, @required this.scrollController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        /*SliverAppBar(
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
        ),*/
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
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({Key key, @required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            )),
        Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              SliverToBoxAdapter(
                  child: CreatePostContainer(currentUser: currentUser)),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onLineUsers: onLineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ContactsList(users: onLineUsers),
            ))
      ],
    );
  }
}

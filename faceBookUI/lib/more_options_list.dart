import 'package:faceBookUI/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'options.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, "info center"],
    [MdiIcons.accountMultiple, Colors.pink, "Friends"],
    [MdiIcons.facebookMessenger, Colors.yellowAccent, "Messenger"],
    [MdiIcons.flag, Colors.orange, "Pages"],
    [MdiIcons.storefront, Colors.blue, "MarketPlace"],
    [Icons.ondemand_video, Colors.red, "Watch"],
    [MdiIcons.calendarStar, Colors.green, "Events"]
  ];
  final User currentUser;

  MoreOptionsList({Key key, @required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 270.0),
      child: ListView.builder(
          itemCount: _moreOptionsList.length,
          itemBuilder: (BuildContext context, int index) {
            final List opt = _moreOptionsList[index];
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: UserCard(user: currentUser),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Options(
                icon: opt[0],
                color: opt[1],
                label: opt[2],
              ),
            );
          }),
    );
  }
}

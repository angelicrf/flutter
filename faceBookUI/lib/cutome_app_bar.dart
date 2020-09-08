import 'package:faceBookUI/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'config/palette.dart';
import 'custom_tab_bar.dart';
import 'models/user_model.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final Function(int) onTap;

  const CustomAppBar(
      {Key key,
      @required this.currentUser,
      @required this.icons,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = 0;
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(color: Colors.limeAccent, boxShadow: [
        BoxShadow(
          color: Colors.black87,
          offset: Offset(0, 2),
          blurRadius: 5.0,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("facebook",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                  fontSize: 33.0,
                  color: Palette.facebookBlue,
                )),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                SizedBox(width: 13.0),
                CircleButton(
                    onPressed: () => print("search clicked..."),
                    icon: Icons.search,
                    iconSize: 30.0),
                CircleButton(
                    onPressed: () => print("Messenger clicked..."),
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}

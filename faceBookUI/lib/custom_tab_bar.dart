import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar(
      {Key key,
      @required this.icons,
      @required this.selectedIndex,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        color: Palette.facebookBlue,
        /*  border: Border(
              top: BorderSide(
            color: Palette.facebookBlue,
            width: 2.5,
          )
          )*/
      ),
      tabs: icons
          .map(
            (e) => Tab(
              icon: Icon(
                e,
                size: 30.0,
                color: Colors.black87,
              ),
            ),
          )
          .toList(),
      onTap: onTap,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final double iconSize;

  const CircleButton(
      {Key key,
      @required this.onPressed,
      @required this.icon,
      @required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7.0),
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      child: IconButton(
          icon: Icon(icon),
          color: Colors.black,
          iconSize: iconSize,
          onPressed: onPressed),
    );
  }
}

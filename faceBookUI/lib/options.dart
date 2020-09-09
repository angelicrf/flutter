import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const Options(
      {Key key,
      @required this.icon,
      @required this.label,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 40.0,
            color: color,
          ),
          SizedBox(
            width: 9.0,
          ),
          Flexible(
              child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}

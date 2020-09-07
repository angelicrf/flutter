import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/models.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final isActive;

  const ProfileAvatar({Key key, @required this.imageUrl, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[200],
      backgroundImage: CachedNetworkImageProvider(this.imageUrl),
    );
  }
}

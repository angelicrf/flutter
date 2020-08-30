import 'dart:io';

import 'package:flutter/cupertino.dart';

class User {

  final int id;
  final String name;
  final File imageUrl;

  User({
    this.id,
    this.imageUrl,
    this.name
});
}
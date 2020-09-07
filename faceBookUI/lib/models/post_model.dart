import 'package:faceBookUI/models/user_model.dart';
import 'package:meta/meta.dart';

class Post {
  final User user;
  final String caption;
  final String timeApp;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;

  const Post({
    @required this.user,
    @required this.imageUrl,
    @required this.caption,
    @required this.timeApp,
    @required this.likes,
    @required this.comments,
    @required this.shares,
  });
}

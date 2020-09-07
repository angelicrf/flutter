import 'package:faceBookUI/models/post_model.dart';
import 'package:faceBookUI/models/story_model.dart';
import 'package:faceBookUI/models/user_model.dart';

final currentUser = User(
    name: "Angelique", imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp');
final List<User> onLineUsers = [
  User(
      name: "david Brooks",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Sarah Mckenzie",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Joe Doe", imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Matthiew Hinki",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Amy Smith",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Milena Callahan",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Kayley Summers",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Bonita Halliday",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Brandon Jacobson",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
  User(
      name: "Elowen Banks",
      imageUrl: 'https://www.gstatic.com/webp/gallery/2.webp'),
];
final List<Story> story = [
  Story(
      user: onLineUsers[0],
      imageUrl: 'https://unsplash.com/photos/bUQ26ASYx78',
      isViewed: true),
  Story(
      user: onLineUsers[1],
      imageUrl: 'https://unsplash.com/photos/dzKBQquyLBw',
      isViewed: false),
  Story(
      user: onLineUsers[2],
      imageUrl: 'https://unsplash.com/photos/wE_TxxSrGBQ',
      isViewed: true),
  Story(
      user: onLineUsers[3],
      imageUrl: 'https://unsplash.com/photos/mwyhFb2WO-4',
      isViewed: true),
  Story(
      user: onLineUsers[4],
      imageUrl: 'https://unsplash.com/photos/Nrxo3lzhQHI',
      isViewed: false),
  Story(
      user: onLineUsers[5],
      imageUrl: 'https://unsplash.com/photos/KLmSWe_pODM',
      isViewed: true),
  Story(
      user: onLineUsers[6],
      imageUrl: 'https://unsplash.com/photos/M_NbX5Afcys',
      isViewed: false),
  Story(
      user: onLineUsers[7],
      imageUrl: 'https://unsplash.com/photos/6Unon01hKwI',
      isViewed: true),
  Story(
      user: onLineUsers[8],
      imageUrl: 'https://unsplash.com/photos/akIfbljbISI',
      isViewed: true),
  Story(
      user: onLineUsers[9],
      imageUrl: 'https://unsplash.com/photos/INVFC49BbmY',
      isViewed: true),
];
final List<Post> posts = [
  Post(
      user: onLineUsers[0],
      caption: "ckeckout these cool 0",
      timeApp: "64m",
      imageUrl: 'https://unsplash.com/photos/bUQ26ASYx78',
      likes: 1546,
      comments: 172,
      shares: 72),
  Post(
      user: onLineUsers[1],
      caption: "ckeckout these cool 1",
      timeApp: "93m",
      imageUrl: 'https://unsplash.com/photos/dzKBQquyLBw',
      likes: 1782,
      comments: 252,
      shares: 26),
  Post(
      user: onLineUsers[2],
      caption: "ckeckout these cool 2",
      timeApp: "53m",
      imageUrl: 'https://unsplash.com/photos/wE_TxxSrGBQ',
      likes: 1983,
      comments: 189,
      shares: 84),
  Post(
      user: onLineUsers[3],
      caption: "ckeckout these cool 3",
      timeApp: "83m",
      imageUrl: 'https://unsplash.com/photos/INVFC49BbmY',
      likes: 1852,
      comments: 352,
      shares: 92),
  Post(
      user: onLineUsers[4],
      caption: "ckeckout these cool 4",
      timeApp: "76m",
      imageUrl: 'https://unsplash.com/photos/6Unon01hKwI',
      likes: 1456,
      comments: 134,
      shares: 56),
  Post(
      user: onLineUsers[5],
      caption: "ckeckout these cool 5",
      timeApp: "98m",
      imageUrl: 'https://unsplash.com/photos/mwyhFb2WO-4',
      likes: 1523,
      comments: 75,
      shares: 16),
  Post(
      user: onLineUsers[6],
      caption: "ckeckout these cool 6",
      timeApp: "84m",
      imageUrl: 'https://unsplash.com/photos/Nrxo3lzhQHI',
      likes: 1875,
      comments: 122,
      shares: 46),
  Post(
      user: onLineUsers[7],
      caption: "ckeckout these cool 7",
      timeApp: "73m",
      imageUrl: 'https://unsplash.com/photos/KLmSWe_pODM',
      likes: 7342,
      comments: 52,
      shares: 66),
  Post(
      user: onLineUsers[8],
      caption: "ckeckout these cool 8",
      timeApp: "33m",
      imageUrl: 'https://unsplash.com/photos/akIfbljbISI',
      likes: 1822,
      comments: 172,
      shares: 96),
  Post(
      user: onLineUsers[9],
      caption: "ckeckout these cool 9",
      timeApp: "58m",
      imageUrl: 'https://unsplash.com/photos/M_NbX5Afcys',
      likes: 1052,
      comments: 172,
      shares: 96),
];

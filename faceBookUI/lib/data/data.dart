import 'package:faceBookUI/models/post_model.dart';
import 'package:faceBookUI/models/story_model.dart';
import 'package:faceBookUI/models/user_model.dart';

final currentUser = User(
    name: "Angelique",
    imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/cat.png');
final List<User> onLineUsers = [
  User(
      name: "david Brooks",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/boat.png'),
  User(
      name: "Sarah Mckenzie",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/girl.png'),
  User(
      name: "Joe Doe",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/fruits.png'),
  User(
      name: "Matthiew Hinki",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'),
  User(
      name: "Amy Smith",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/pool.png'),
  User(
      name: "Milena Callahan",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/peppers.png'),
  User(
      name: "Kayley Summers",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/mountain.png'),
  User(
      name: "Bonita Halliday",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/tulips.png'),
  User(
      name: "Brandon Jacobson",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/watch.png'),
  User(
      name: "Elowen Banks",
      imageUrl: 'https://homepages.cae.wisc.edu/~ece533/images/serrano.png'),
];
final List<Story> stories = [
  Story(
      user: onLineUsers[0],
      imageUrl:
          'https://i.postimg.cc/8kRhKtD7/tony-pham-MApm-Up-GIk-Wc-unsplash.jpg',
      isViewed: true),
  Story(
      user: onLineUsers[1],
      imageUrl:
          'https://i.postimg.cc/W3XJVf48/klara-kulikova-I3-Ri-FLMw-QQA-unsplash.jpg',
      isViewed: false),
  Story(
      user: onLineUsers[2],
      imageUrl:
          'https://i.postimg.cc/VkVMrh9V/kevin-turcios-1ynqyhz-JNNI-unsplash.jpg',
      isViewed: true),
  Story(
      user: onLineUsers[3],
      imageUrl:
          'https://i.postimg.cc/JnbBF4ff/karsten-winegeart-sksq-Vaf-EYFo-unsplash.jpg',
      isViewed: true),
  Story(
      user: onLineUsers[4],
      imageUrl:
          'https://i.postimg.cc/66fvLqLR/gabriel-mccallin-fgm-Ff-Ld-Rcx-A-unsplash.jpg',
      isViewed: false),
  Story(
      user: onLineUsers[5],
      imageUrl:
          'https://i.postimg.cc/cLrtSmqM/billow926-w-ZQ4-Lc-Clsa4-unsplash.jpg',
      isViewed: true),
  Story(
      user: onLineUsers[6],
      imageUrl:
          'https://i.postimg.cc/kM2x9qxt/karsten-winegeart-Jc-UCKGh-Il-U-unsplash.jpg',
      isViewed: false),
  Story(
      user: onLineUsers[7],
      imageUrl:
          'https://i.postimg.cc/XqsXMZQz/jasmin-chew-j1x8-HR5-Gs-F4-unsplash.jpg',
      isViewed: true),
  Story(
      user: onLineUsers[8],
      imageUrl:
          'https://i.postimg.cc/63wQyVPP/luke-thornton-JNl7o-Mj2cc-unsplash.jpg',
      isViewed: true),
  Story(
      user: onLineUsers[9],
      imageUrl:
          'https://i.postimg.cc/zX3Tz5Kg/anasta-olson-Sj-N0li2z-QJA-unsplash-1.jpg',
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

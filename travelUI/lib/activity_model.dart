class Activity {

  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;

  Activity({
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.startTimes,
    this.type,
  });
}
List<Activity> activities = [
  Activity(
    imageUrl: "assets/images/image_1.jpg",
    name: "Paris",
    type: "La tour Eiffel",
    startTimes: ["11:30am to 13:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_2.jpg",
    name: "Mexican Resorts",
    type: "Ocean Exploring",
    startTimes: ["14:30pm to 16:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_3.jpg",
    name: "Italy",
    type: "Valencia",
    startTimes: ["17:30pm to 19:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_4.jpg",
    name: "Quanary Islands",
    type: "Fishing",
    startTimes: ["10:30am to 12:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_5.jpg",
    name: "Bahama",
    type: "Swimming",
    startTimes: ["13:30pm to 16:40pm"],
    rating: 5,
    price: 30,
  )
];

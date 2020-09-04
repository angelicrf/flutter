class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  List<Activity> activities;
  int rating;
  int price;

  Activity({
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.startTimes,
    this.type,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: "assets/images/image_1.jpg",
    name: "Egina",
    type: "Fishing",
    startTimes: ["11:30am", "13:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_2.jpg",
    name: "Mexican Resorts",
    type: "Diving",
    startTimes: ["14:30pm", "16:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_3.jpg",
    name: "Italy",
    type: "Boating",
    startTimes: ["17:30pm", "19:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_4.jpg",
    name: "Paris",
    type: "La tour Eiffel",
    startTimes: ["10:30am", "12:40pm"],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/images/image_5.jpg",
    name: "Bahama",
    type: "Swimming",
    startTimes: ["13:30pm", "16:40pm"],
    rating: 5,
    price: 30,
  )
];

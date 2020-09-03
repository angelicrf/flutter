
import 'activity_model.dart';

class Destination{
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;
  List<Destination> destinations;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
    this.destinations,
});
}
List<Destination> destinations = [
  Destination(
    imageUrl: "assets/images/image_1.jpg",
    city: "Paris",
    country: "France",
    description: "visit Egina For an amazing tour",
    activities: activities,
  ),
  Destination(
    imageUrl: "assets/images/image_2.jpg",
    city: "Mexico-City",
    country: "Mexico",
    description: "visit Mexico-City For an amazing tour",
    activities: activities,
  ),
  Destination(
    imageUrl: "assets/images/image_3.jpg",
    city: "Valencia",
    country: "Italy",
    description: "visit Valencia For an amazing tour",
    activities: activities,
  ),
  Destination(
    imageUrl: "assets/images/image_4.jpg",
    city: "Egina",
    country: "Greece",
    description: "visit la tour Eiffel For an amazing tour",
    activities: activities,
  ),
  Destination(
    imageUrl: "assets/images/image_5.jpg",
    city: "Bahama",
    country: "U.S",
    description: "visit Bahama For an amazing tour",
    activities: activities,
  )
];

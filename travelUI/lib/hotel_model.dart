
class Hotel{
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
});
}
final List<Hotel> hotels = [
  Hotel(
    imageUrl: "assets/images/hotel_1.jpg",
    name: "Hotel 1",
    address: "35 Ave NE",
    price: 190,
  ),
  Hotel(
    imageUrl: "assets/images/hotel_2.jpg",
    name: "Hotel 2",
    address: "37 Ave NE",
    price: 190,
  ),
  Hotel(
    imageUrl: "assets/images/hotel_3.jpg",
    name: "Hotel 3",
    address: "39 Ave NE",
    price: 190,
  ),
  Hotel(
    imageUrl: "assets/images/hotel_4.jpg",
    name: "Hotel 4",
    address: "40 Ave NE",
    price: 190,
  ),
  Hotel(
    imageUrl: "assets/images/hotel_5.jpg",
    name: "Hotel 5",
    address: "42 Ave NE",
    price: 190,
  ),
];

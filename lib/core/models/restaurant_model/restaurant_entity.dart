abstract class RestaurantEntity {
  String uid;
  String name;
  String primaryColor;
  String logo;
  String primaryImage;
  num rate;

  RestaurantEntity({
    required this.uid,
    required this.name,
    required this.primaryColor,
    required this.logo,
    required this.primaryImage,
    required this.rate,
  });
}

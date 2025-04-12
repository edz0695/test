class CaCategoriseServiceModel {
  String id;
  String title;
  String description;
  String image;
  String price;
  String cross_price;

  CaCategoriseServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.cross_price,
  });

  factory CaCategoriseServiceModel.fromMap(Map<dynamic, dynamic> map) {
    return CaCategoriseServiceModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      image: map['logo'] ?? "",
      price: map['price'] ?? "",
      cross_price: map['cross_price'] ?? "",
    );
  }
}

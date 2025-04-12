// MUG MODEL
class Mug {
  final String name;
  final List colors;
  final List size;
  final List ratings;
  final List imageUrls;
  final String price;
  final String discountPrice;
  final String description;
  final String shortDescription;
  final String thumbnail;
  final String productId;

  // final String categoryId;

  Mug(
      {required this.description,
      required this.shortDescription,
      required this.thumbnail,
      required this.colors,
      required this.size,
      required this.ratings,
      required this.productId,
      // required this.categoryId,
      required this.name,
      required this.imageUrls,
      required this.price,
      required this.discountPrice});

  factory Mug.fromJson(json) {
    print("Product name : ${json['title']}");
    print(json['title']);
    print(json['new_price']);
    print(json['old_price']);
    print(json['description']);
    print(json['shortDescription']);
    print(json['thumbnail']);
    print(json['colors']);
    print(json['size']);
    print(json['ratings']);
    print(json['title']);
    print(json['id']);
    Mug product = Mug(
      name: json['title'].toString(),
      imageUrls: json['images'],
      price: json['new_price'].toString(),
      discountPrice: json['old_price'].toString(),
      description: json["description"].toString(),
      shortDescription: json["shortDescription"].toString(),
      thumbnail: json["thumbnail"].toString(),
      colors: json["colors"],
      size: json["size"],
      ratings: ["ratings"],
      productId: json['id'].toString(),
      // categoryId: json['category']["id"].toString()
    );

    return product;
  }
}

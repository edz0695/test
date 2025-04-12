class SambhavTubeCategoryModel {
  final List<Data> data;

  SambhavTubeCategoryModel({
    required this.data,
  });

  // Factory method to create an instance from JSON
  factory SambhavTubeCategoryModel.fromJson(Map<String, dynamic> json) {
    return SambhavTubeCategoryModel(
      data: List<Data>.from(json['data'].map((item) => Data.fromJson(item))),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),

    };
  }
}

// Data Model
class Data {
  final String catName;
  final String catImg;
  final int status;
  final String id;

  Data({
    required this.catName,
    required this.catImg,
    required this.status,
    required this.id,
  });

  // Factory method to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      catName: json['cat_name'],
      catImg: json['cat_img'],
      status: json['status'],
      id: json['id'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'cat_name': catName,
      'cat_img': catImg,
      'status': status,
      'id': id,
    };
  }
}

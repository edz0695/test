class CaCategoryModel {
  String id;
  String title;
  String icon;

  CaCategoryModel({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory CaCategoryModel.fromMap(Map<dynamic, dynamic> map) {
    return CaCategoryModel(
      id: map['id'] ?? "",
      title: map['cat_name'] ?? "",
      icon: map['icon'] ?? "",
    );
  }
}

class SambhavTubeModel {
  String id;
  String user_id;

  String user_name;
  String user_logo;
  String tubecategory_id;
  String title;
  String description;
  String thumbnail;
  String video;
  String likes;
  String views;

  SambhavTubeModel(
      {required this.id,
      required this.user_id,
      required this.tubecategory_id,
      required this.title,
      required this.description,
      required this.thumbnail,
      required this.video,
      required this.user_logo,
      required this.user_name,
      required this.likes,
      required this.views});

  factory SambhavTubeModel.fromMap(Map<dynamic, dynamic> map) {
    return SambhavTubeModel(
        id: map['id'] ?? "",
        user_id: map['user_id'] ?? "",
        tubecategory_id: map['tubecategory_id'] ?? "",
        title: map['title'] ?? "",
        description: map['description'] ?? "",
        thumbnail: map['thumbnail'] ?? "",
        video: map['video'] ?? "",
        user_logo: map['id'] ?? '',
        user_name: map['id'] ?? '',
        likes: map['likes'] ?? '',
        views: map['views'] ?? '');
  }
}

class SambhavTubeCatModel {
  String id;
  String name;
  String icon;

  SambhavTubeCatModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory SambhavTubeCatModel.fromMap(Map<dynamic, dynamic> map) {
    return SambhavTubeCatModel(
        id: map['id'] ?? "", name: map['name'] ?? "", icon: map['icon'] ?? "");
  }
}

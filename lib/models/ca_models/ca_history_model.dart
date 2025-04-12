class CAHistoryModel {
  List<CAHistoryCategory> data;

  CAHistoryModel({
    required this.data,
  });

  factory CAHistoryModel.fromJson(Map<String, dynamic> json) {
    return CAHistoryModel(
      data: (json['data'] as List)
          .map((item) => CAHistoryCategory.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class CAHistoryCategory {
  String title;
  String logo;
  String status;
  String id;

  CAHistoryCategory({
    required this.title,
    required this.logo,
    required this.status,
    required this.id,
  });

  factory CAHistoryCategory.fromJson(Map<String, dynamic> json) {
    return CAHistoryCategory(
      title: json['title'] as String,
      logo: json['logo'] as String,
      status: json['status'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'logo': logo,
      'status': status,
      'id': id,
    };
  }
}

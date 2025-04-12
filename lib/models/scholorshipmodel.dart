class ScholarshipModel {
  final String title;
  final String logo;
  final String url;
  final List<String> banner;
  final String details;
  final int status;
  final String id;

  ScholarshipModel({
    required this.title,
    required this.logo,
    required this.url,
    required this.banner,
    required this.details,
    required this.status,
    required this.id,
  });

  // Factory method to create a model from a map
  factory ScholarshipModel.fromMap(Map<String, dynamic> map) {
    return ScholarshipModel(
      title: map['title'] ?? '',
      logo: map['logo'] ?? '',
      url: map['url'] ?? '',
      banner: List<String>.from(map['banner'] ?? []),
      details: map['details'] ?? '',
      status: map['status'] ?? 0,
      id: map['id'] ?? '',
    );
  }

  // Method to convert the model back to a map (if needed)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'logo': logo,
      'url': url,
      'banner': banner,
      'details': details,
      'status': status,
      'id': id,
    };
  }
}

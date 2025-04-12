class CAHomeServicesModel {
  final String? id; // Nullable String
  final String? name; // Nullable String
  final String? image; // Nullable String
  final int? status; // Nullable int

  CAHomeServicesModel({
    this.id,
    this.name,
    this.image,
    this.status,
  });

  factory CAHomeServicesModel.fromJson(Map<String, dynamic> json) {
    return CAHomeServicesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'status': status,
    };
  }
}

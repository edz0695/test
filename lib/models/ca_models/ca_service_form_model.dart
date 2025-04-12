
class CAServiceFormModel {
  final List<ServiceData> data;

  CAServiceFormModel({
    required this.data,
  });

  // From JSON
  factory CAServiceFormModel.fromJson(Map<String, dynamic> json) {
    return CAServiceFormModel(
      data: (json['data'] as List)
          .map((item) => ServiceData.fromJson(item))
          .toList(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

// Model class for each service's data
class ServiceData {
  final String caServiceId;
  final List<CAFormField> formData;
  final String id;

  ServiceData({
    required this.caServiceId,
    required this.formData,
    required this.id,
  });

  // From JSON
  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      caServiceId: json['ca_service_id'] ?? '',
      formData: (json['form_data'] as List)
          .map((item) => CAFormField.fromJson(item))
          .toList(),
      id: json['id'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'ca_service_id': caServiceId,
      'form_data': formData.map((item) => item.toJson()).toList(),
      'id': id,
    };
  }
}

// Model class for each form field (file input)
class CAFormField {
  final String label;
  final String type;
  final bool required;
  final String id;

  CAFormField({
    required this.label,
    required this.type,
    required this.required,
    required this.id,
  });

  // From JSON
  factory CAFormField.fromJson(Map<String, dynamic> json) {
    return CAFormField(
      label: json['lable'] ?? '',
      type: json['type'] ?? '',
      required: json['required'] ?? false,
      id: json['_id'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'lable': label,
      'type': type,
      'required': required,
      '_id': id,
    };
  }
}

class CaFormParameterModel {
  String id;
  String caServiceId;
  String inputType;
  String type;
  String label;
  String options;
  String validation;
  String required;


  CaFormParameterModel({
    required this.id,
    required this.caServiceId,
    required this.inputType,
    required this.type,
    required this.label,
    required this.options,
    required this.validation,
    required this.required,

  });





  factory CaFormParameterModel.fromMap(Map<dynamic, dynamic> map) {
    return CaFormParameterModel(
      id: map['id'] ?? "",
      caServiceId: map['ca_service_id']??"",
      inputType: map['input_type']??"",
      type: map['type']??"",
      label: map['lable']??"",
      options: map['options']??"",
      validation: map['validation']??"",
      required: map['required']??"",

    );
  }







}



class CaServiceDetailsModel {
  String title;
  String description;


  CaServiceDetailsModel({
    required this.title,
    required this.description,
  });





  factory CaServiceDetailsModel.fromMap(Map<dynamic, dynamic> map) {
    return CaServiceDetailsModel(
      title: map['title'] ?? "",
      description: map['description']??"",
    );
  }







}




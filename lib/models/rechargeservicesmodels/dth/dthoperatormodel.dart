
class DthOperatorModel {
  String id;
  String type;
  String category;
  String name;
  String code;


  DthOperatorModel({
    required this.id,
    required this.type,
    required this.category,
    required this.name,
    required this.code,



  });





  factory DthOperatorModel.fromMap(Map<dynamic, dynamic> map) {

    return DthOperatorModel(
      id: map['id'] ?? "",
      type: map['type']??"",
      category: map['category']??"",
      name: map['name']??"",
      code: map['code']??"",


    );
  }







}
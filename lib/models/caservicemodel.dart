import 'cacategory_model.dart';
class CaServiceModel {
  String id;
  String title;
  String description;
  List<CaCategoryModel> categories;
  String trainingVideo;
  List bannerImage;


  CaServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.trainingVideo,
    required this.categories,
    required this.bannerImage

  });





  factory CaServiceModel.fromMap(Map<dynamic, dynamic> map) {
    var categories = map["category"] as List;
    return CaServiceModel(
      id: map['basic']['id'] ?? "",
      title: map['basic']['title']??"",
      description: map['basic']['description']??"",
      trainingVideo: map['basic']['tr_video']??"",
      categories: categories.map((e) => CaCategoryModel.fromMap(e)).toList(),
      bannerImage: map['basic']['banner']??"",

    );
  }







}




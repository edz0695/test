


class EarnMainModel {
  List<EarnCategoryModel> activeCategories;
  List<EarnBannersModel> banners;



  EarnMainModel({
    required this.activeCategories,
    required this.banners,

  });





  factory EarnMainModel.fromMap(Map<dynamic, dynamic> map) {
    final activeCategoriesTemp = (map['data']??[]) as List;
    final banners = (map['banner']??[]) as List;
    return EarnMainModel(
      activeCategories: activeCategoriesTemp.map((e) => EarnCategoryModel.fromMap(e)).toList(),
      banners: banners.map((e) => EarnBannersModel.fromMap(e)).toList()
    );
  }







}


class EarnCategoryModel {
  String id;
  String categoryName;
  String icon;
  String reward;
  String status;



  EarnCategoryModel({
    required this.id,
    required this.categoryName,
    required this.icon,
    required this.reward,
    required this.status,

  });





  factory EarnCategoryModel.fromMap(Map<dynamic, dynamic> map) {

    return EarnCategoryModel(
      id: map['id'] ?? "",
      categoryName: map['cat_name']??"",
      icon: map['cat_img']??"",
      reward: map['hl_text']??"",
      status: map['status'].toString() ??"",
    );
  }







}






class EarnBannersModel {
  String offerId;
  String bannerImage;



  EarnBannersModel({
    required this.offerId,
    required this.bannerImage,

  });





  factory EarnBannersModel.fromMap(Map<dynamic, dynamic> map) {
    return EarnBannersModel(
      offerId: map['offer_id'] ?? "",
      bannerImage: map['banner']??"",
    );
  }







}


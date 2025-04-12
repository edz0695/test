class OffersModel {
  List<EarnOfferModel> newOffers;
  List<EarnOfferModel> oldOffers;

  OffersModel({
    required this.newOffers,
    required this.oldOffers,
  });

  factory OffersModel.fromMap(List<dynamic> map) {
    print(
        "===========Im filling ===============================================");
    // factory OffersModel.fromMap(Map<dynamic, dynamic> map) {
    // final newOffers = (map["new"]??[]) as List;
    // final oldOffers = (map["old"]??[]) as List;

    final newOffers = (map ?? []);
    final oldOffers = (map ?? []);
    // final newOffers = (map["data"]??[]) as List;
    // final oldOffers = (map["data"]??[]) as List;

    return OffersModel(
      newOffers: newOffers.map((e) => EarnOfferModel.fromMap(e)).toList(),
      oldOffers: oldOffers.map((e) => EarnOfferModel.fromMap(e)).toList(),
    );
  }

  factory OffersModel.fromMap2(Map<dynamic, dynamic> map) {
    print(
        "===========Im filling ===============================================");
    // factory OffersModel.fromMap(Map<dynamic, dynamic> map) {
    // final newOffers = (map["new"]??[]) as List;
    // final oldOffers = (map["old"]??[]) as List;

    final newOffers = (map ?? []) as List;
    final oldOffers = (map ?? []) as List;
    // final newOffers = (map["data"]??[]) as List;
    // final oldOffers = (map["data"]??[]) as List;

    return OffersModel(
      newOffers: newOffers.map((e) => EarnOfferModel.fromMap(e)).toList(),
      oldOffers: oldOffers.map((e) => EarnOfferModel.fromMap(e)).toList(),
    );
  }
}

class EarnOfferModel {
  String id;
  String title;
  String highlight;
  String oldPrice;
  String offerPrice;
  String logoImage;
  String shareLink;

  EarnOfferModel({
    required this.id,
    required this.title,
    required this.highlight,
    required this.offerPrice,
    required this.oldPrice,
    required this.logoImage,
    required this.shareLink,
  });

  factory EarnOfferModel.fromMap(Map<dynamic, dynamic> map) {
    return EarnOfferModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      highlight: map['highlight'] ?? "",
      offerPrice: map['offer_price'] ?? "",
      oldPrice: map['old_price'] ?? "",
      shareLink: map['share_link'] ?? "",
      logoImage: map['logo'] ?? "",
    );
  }
}

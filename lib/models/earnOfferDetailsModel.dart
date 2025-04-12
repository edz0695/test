class EarnOfferDetailsModel {
  String id;
  String title;
  String highlight;
  String offerUrl;
  String shareText;
  String shareImage;
  String offerPrice;
  String oldPrice;

  // String commissionType;
  // String commision;
  String terms;
  String description;
  String isShareable;
  String shareLink;
  String offerId;
  List<String> bannerImage;
  String logo;
  List<String> trVideo;
  List<String> shareMedia;
  String benefits;
  List<FaqModel> faqList;
  String howItWorks;
  String isNew;

  // String startFrom;
  // String endAt;

  EarnOfferDetailsModel({
    required this.id,
    required this.title,
    required this.shareText,
    required this.shareImage,
    required this.offerPrice,
    required this.description,
    required this.bannerImage,
    required this.trVideo,
    required this.faqList,
    required this.shareMedia,
    required this.benefits,
    required this.howItWorks,
    required this.oldPrice,
    required this.highlight,
    // required this.commision,
    // required this.commissionType,
    // required this.endAt,
    required this.isShareable,
    required this.isNew,
    required this.logo,
    required this.terms,
    required this.offerId,
    required this.offerUrl,
    required this.shareLink,
    // required this.startFrom
  });

  factory EarnOfferDetailsModel.fromMap(Map<dynamic, dynamic> map) {
    // final formParams = (map['offerform'] ?? []) as List;
    final faqList = (map['faqs'] ?? []) as List;
    final shareMediaTemp = (map['sh_media'] ?? []) as List;
    return EarnOfferDetailsModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      highlight: map['highlight'] ?? "",
      offerUrl: map['offer_url'] ?? "",
      shareText: map['share_text'] ?? "",
      shareImage: map['share_image'] ?? "",
      offerPrice: map['offer_price'] ?? "",
      oldPrice: map['old_price'] ?? "",
      // commision: map['commission'] ?? "",
      // commissionType: map['commission'] ?? "",
      description: map['description'] ?? "",
      terms: map['terms'] ?? "",
      isShareable: map['is_sharabale'] ?? "",
      shareLink: map['share_link'] ?? "",
      offerId: map['offer_id'] ?? "",
      bannerImage: map['banner_img'] ?? "",
      logo: map['logo'] ?? "",
      trVideo: map['tr_video'] ?? "",
      shareMedia: shareMediaTemp.map((e) => e.toString()).toList(),
      benefits: map['benefits'] ?? "",
      faqList: faqList.map((e) => FaqModel.fromMap(e)).toList(),
      // whomToSell: map['details']['whome_to_sell'] ?? "",
      howItWorks: map['details']['how_it_works'] ?? "",
      isNew: map['share_image'] ?? "",
      // endAt: map['share_image'] ?? "",
      // startFrom: map['share_image'] ?? "",
      // termsAndConditions: map['details']['t_c'] ?? "",
      // formParameters:
      //     formParams.map((e) => FormParameterModel.fromMap(e)).toList());
    );
  }
}

class FaqModel {
  String id;
  String offerId;
  String question;
  String answer;

  FaqModel({
    required this.id,
    required this.offerId,
    required this.question,
    required this.answer,
  });

  factory FaqModel.fromMap(Map<dynamic, dynamic> map) {
    return FaqModel(
      id: map['id'] ?? "",
      offerId: map['offer_id'] ?? "",
      question: map['question'] ?? "",
      answer: map['answer'] ?? "",
    );
  }
}

// class FormParameterModel {
//   String id;
//   String offerId;
//   String inputType;
//   String type;
//   String label;
//   String options;
//   String validation;
//   String required;
//
//   FormParameterModel({
//     required this.id,
//     required this.offerId,
//     required this.inputType,
//     required this.type,
//     required this.label,
//     required this.options,
//     required this.validation,
//     required this.required,
//   });
//
//   factory FormParameterModel.fromMap(Map<dynamic, dynamic> map) {
//     return FormParameterModel(
//       id: map['id'] ?? "",
//       offerId: map['offer_id'] ?? "",
//       inputType: map['input_type'] ?? "",
//       type: map['type'] ?? "",
//       label: map['lable'] ?? "",
//       options: map['options'] ?? "",
//       validation: map['validation'] ?? "",
//       required: map['required'] ?? "",
//     );
//   }
// }

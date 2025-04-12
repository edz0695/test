


class EarnBanksModel {
  String id;
  String bankName;
  String image;
  String status;



  EarnBanksModel({
    required this.id,
    required this.bankName,
    required this.image,
    required this.status,

  });





  factory EarnBanksModel.fromMap(Map<dynamic, dynamic> map) {
    return EarnBanksModel(
      id: map['id'] ?? "",
      bankName: map['bank_name']??"",
      image: map['bank_icon']??"",
      status: map['status']??"",
    );
  }







}

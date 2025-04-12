


class AccountManagerModel {
  String id;
  String name;
  String email;
  String mobile;
  String image;
  String status;


  AccountManagerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.image,
    required this.status,
  });

  factory AccountManagerModel.fromMap(Map<dynamic, dynamic> map) {
    return AccountManagerModel(
      id: map['id'] ?? "",
      name: map['name']??"",
      email: map['email']??"",
      mobile: map['mobile']??"",
      image: map['img']??"",
      status: map['status']??"",
    );
  }

}

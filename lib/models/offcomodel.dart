
class OffCoModel {
    OffCoModel({
        required this.id,
        required this.name,
        required this.speciality,
        required this.address,
        required this.email,
        required this.mobile  ,
    });

    String id;
    String name;
    String speciality;
    String address;
    String email;
    String mobile;

    factory OffCoModel.fromMap(Map<dynamic, dynamic> map) {
    return OffCoModel(
      id: map['id'] ?? "",
      name: map['name']??"",
      speciality: map['speciality']??"",
      address: map['address']??"",
      email: map['email']??"",
      mobile: map['mobile']??"",
    );
  }
}

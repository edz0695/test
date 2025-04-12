class TutorModel {
    TutorModel({
        required this.id,
      required this.userId,
        required this.name,
        required this.email,
        required this.mobile,
        required this.fee,
        required this.subjects,
        required this.city,
        required this.zipcode,
        required this.address,
        required this.image,
        required this.date,
    });

    String id;
    String userId;
    String name;
    String email;
    String fee;
    String mobile;
    String subjects;
    String city;
    String zipcode;
    String address;
    String image;
    
    String date;

    factory TutorModel.fromMap(Map<dynamic, dynamic> map) {
    return TutorModel(
      id: map['id'] ?? "",
      userId: map['user_id'] ?? "",
      name: map['name']??"",
      email: map['email']??"",
      fee: map['fee']??"",
      mobile: map['mobile']??"",
      subjects: map['subjects']??"",
      city: map['city']??"",
      zipcode: map['zipcode']??"",
      address: map['address']??"",
      image: map['image']??"",
      date: map['date']??"",
    );
  }
}

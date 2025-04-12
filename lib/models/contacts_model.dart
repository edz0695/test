class ContactsModel {
  String name;
  String number;


  ContactsModel({
    required this.name,
    required this.number,

  });





  factory ContactsModel.fromMap(Map<dynamic, dynamic> map) {
    return ContactsModel(
      name: map['Name'] ?? "",
      number: map['MobileNumber']??"",

    );
  }







}

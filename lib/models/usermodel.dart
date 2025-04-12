enum EducationType { teacher, student, job, hire }

enum TeachingStyle { online, offline }

class UserModel {
  String id;
  String name;
  String Token;
  String email;
  String password;
  String mobile;
  String referCode;
  String signUpMethod;
  String aadharCardNo;
  String panCardNo;
  String aadharImage;
  String panImage;
  String userKycStatus;
  String kycStatus;
  String status;
  String dob;
  String isBanned;
  String image;
  String points;
  String balance;
  String academicStatus;
  EducationType? educationType;
  EducationType? educationTypeTeacher;
  String competitive;
  String managerId;
  String createdAt;

  UserModel({
    required this.id,
    required this.Token,
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
    required this.referCode,
    required this.signUpMethod,
    required this.aadharCardNo,
    required this.panCardNo,
    required this.aadharImage,
    required this.panImage,
    required this.userKycStatus,
    required this.kycStatus,
    required this.status,
    required this.dob,
    required this.isBanned,
    required this.image,
    required this.points,
    required this.balance,
    required this.academicStatus,
    required this.educationType,
    required this.educationTypeTeacher,
    required this.competitive,
    required this.managerId,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      Token: map['token'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      mobile: map['mobile'] ?? "",
      referCode: map['refer_code'] ?? "",
      signUpMethod: map['sign_up_method'] ?? "",
      aadharCardNo: map['aadhar_card_no'] ?? "",
      panCardNo: map['pan_card_no'] ?? "",
      aadharImage: map['aadhar_img'] ?? "",
      panImage: map["pan_img"] ?? "",
      userKycStatus: map['user_kyc_status'] ?? "",
      kycStatus: map['kyc_status'].toString(),
      status: map['status'].toString(),
      dob: map['dob'] ?? "",
      isBanned: map['is_banned'].toString(),
      image: map['img'] ?? "",
      points: map['points'].toString(),
      balance: map['balance'].toString(),
      academicStatus: map['academic_status'] ?? "",
      educationType: map['is_student'] == "1" ? EducationType.student : null,
      educationTypeTeacher:
          map['is_teacher'] == "1" ? EducationType.teacher : null,
      competitive: map['competitive'].toString(),
      managerId: map['manager_id'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
      "referCode": referCode,
      "signUpMethod": signUpMethod,
      "aadharCardNo": aadharCardNo,
      "panCardNo": panCardNo,
      "aadharImage": aadharImage,
      "panImage": panImage,
      "userKycStatus": userKycStatus,
      "kycStatus": kycStatus,
      "status": status,
      "dob": dob,
      "isBanned": isBanned,
      "image": image,
      "points": points,
      "balance": balance,
      "academicStatus": academicStatus,
      "educationType": educationType,
      "educationTypeTeacher": educationTypeTeacher,
      "competitive": competitive,
      "managerId": managerId,
      "createdAt": createdAt,
    };
  }
}

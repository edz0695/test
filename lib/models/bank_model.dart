

class BankModel {
  String userId;
  String bankName;
  String accountHolderName;
  String accountNumber;
  String ifscCode;

  BankModel({
    required this.userId,
    required this.bankName,
    required this.accountHolderName,
    required this.accountNumber,
    required this.ifscCode,
  });


  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'bank_name': bankName,
      'name': accountHolderName,
      'acc_number': accountNumber,
      'ifsc': ifscCode,
    };
  }

  factory BankModel.fromMap(Map<dynamic, dynamic> map) {
    return BankModel(
      userId: map['user_id']??"",
      bankName: map['bank_name']??"",
      accountHolderName: map['name']??"",
      accountNumber: map['acc_number']??"",
      ifscCode: map['ifsc'] ?? '',
    );
  }
}

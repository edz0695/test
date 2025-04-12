class BillModel {
  int code;
  double amount;
  Map additionalParams;
  String billDate;
  String dueDate;
  String accountHolderName;
  String refId;
  String billerId;
  String status;
  String requestTimeStamp;


  BillModel({
    required this.code,
    required this.amount,
    required this.additionalParams,
    required this.billDate,
    required this.dueDate,
    required this.accountHolderName,
    required this.refId,
    required this.billerId,
    required this.status,
    required this.requestTimeStamp,

  });





  factory BillModel.fromMap(Map<dynamic, dynamic> map) {
    return BillModel(
      code: map['code'] ?? "",
      amount: double.parse(map['amount'].toString()),
      additionalParams: map['additionalParams']??"",
      billDate: map['billDate']??"",
      dueDate: map['dueDate']??"",
      accountHolderName: map['accountHolderName']??"",
      refId: map['refId']??"",
      billerId: map['billerId']??"",
      status: map['status']??"",
      requestTimeStamp: map['requestTimeStamp']??"",

    );
  }







}




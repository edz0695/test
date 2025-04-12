



class PaymentVerificationModel {
  String refId;
  String timeStamp;
  int amount;
  String billerId;
  String additionalParams;



  PaymentVerificationModel({
    required this.refId,
    required this.timeStamp,
    required this.amount,
    required this.billerId,
    required this.additionalParams,
  });





  factory PaymentVerificationModel.fromMap(Map<dynamic, dynamic> map) {

    return PaymentVerificationModel(
      refId: map['refId'] ?? "",
      timeStamp: map['requestTimeStamp']??"",
      amount: map['amount']??"",
      billerId: map['billerId']??"",
      additionalParams: map['additionalParams']??"",
    );
  }







}
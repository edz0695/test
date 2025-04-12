class TransactionHistoryModel {
  final List<TransactionHistoryData> data;

  TransactionHistoryModel({
    required this.data,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryModel(
      data: (json['data'] as List)
          .map((item) => TransactionHistoryData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class TransactionHistoryData {
  final String user;
  final String orderId;
  final String transactionId;
  final double amount;
  final String type;
  final String mode;
  final String details;
  final int status;
  final String id;

  TransactionHistoryData({
    required this.user,
    required this.orderId,
    required this.transactionId,
    required this.amount,
    required this.type,
    required this.mode,
    required this.details,
    required this.status,
    required this.id,
  });

  factory TransactionHistoryData.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryData(
      user: json['user'] ?? '',
      orderId: json['order_id'] ?? '',
      transactionId: json['transaction_id'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      type: json['type'] ?? '',
      mode: json['mode'] ?? '',
      details: json['details'] ?? '',
      status: json['status'] ?? 0,
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'order_id': orderId,
      'transaction_id': transactionId,
      'amount': amount,
      'type': type,
      'mode': mode,
      'details': details,
      'status': status,
      'id': id,
    };
  }
}
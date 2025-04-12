class WalletsModel {
  double balance;
  double totalEarning;
  double pending;
  double confirmed;
  List<WalletTransactionModel> transactions;
  List<WalletTransactionModel> conformTransactions;
  List<WalletTransactionModel> pendingTransactions;
  List<WalletTransactionModel> withdrawableTransactions;

  WalletsModel({
    required this.pending,
    required this.confirmed,
    required this.balance,
    required this.totalEarning,
    required this.transactions,
    required this.conformTransactions,
    required this.pendingTransactions,
    required this.withdrawableTransactions,
  });

  factory WalletsModel.fromMap(Map<dynamic, dynamic> map) {
    final transactions = (map['transaction'] ?? []) as List;
    final conformTransactions = (map['confirmtransaction'] ?? []) as List;
    final pendingTransactions = (map['pendingtransaction'] ?? []) as List;
    final withdrawableTransactions =
        (map['withdrawabletransaction'] ?? []) as List;
    return WalletsModel(
      pending: double.tryParse(map['pending']) ?? 0,
      confirmed: double.tryParse(map['confirmed']) ?? 0,
      balance: double.tryParse(map['balance']) ?? 0,
      totalEarning: double.tryParse(map['total-earning']) ?? 0,
      transactions:
          transactions.map((e) => WalletTransactionModel.fromMap(e)).toList(),
      conformTransactions: conformTransactions
          .map((e) => WalletTransactionModel.fromMap(e))
          .toList(),
      pendingTransactions: pendingTransactions
          .map((e) => WalletTransactionModel.fromMap(e))
          .toList(),
      withdrawableTransactions: withdrawableTransactions
          .map((e) => WalletTransactionModel.fromMap(e))
          .toList(),
    );
  }
}

class WalletTransactionModel {
  String id;
  String user;
  String amount;
  String message;
  String status;
  String date;
  String mode;
  String type;
  String details;

  WalletTransactionModel({
    required this.id,
    required this.user,
    required this.amount,
    required this.message,
    required this.status,
    required this.date,
    required this.details,
    required this.type,
    required this.mode,
  });

  factory WalletTransactionModel.fromMap(Map<dynamic, dynamic> map) {
    return WalletTransactionModel(
      id: map['id'] ?? "",
      user: map['user'] ?? "",
      amount: map['amount'] ?? "",
      message: map['message'] ?? "",
      status: map['status'] ?? "",
      date: map['createdAt'] ?? "",
      mode: map['mode'] ?? "",
      type: map['type'] ?? "",
      details: map['details'] ?? "",
    );
  }
}

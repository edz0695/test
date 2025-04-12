class WalletBalanceModel {
  final WalletData? data;

  WalletBalanceModel({this.data});

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) {
    return WalletBalanceModel(
      data: json['data'] != null ? WalletData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
    };
  }
}

class WalletData {
  final double? wallet;
  final double? pendingWallet;
  final double? confirmedBalance;

  WalletData({this.wallet, this.pendingWallet, this.confirmedBalance});

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      wallet: _toDouble(json['wallet']),
      pendingWallet: _toDouble(json['pendingWallet']),
      confirmedBalance: _toDouble(json['confermedBalance']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wallet': wallet,
      'pendingWallet': pendingWallet,
      'confermedBalance': confirmedBalance,
    };
  }

  /// Helper function to safely convert `int` to `double`
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    return value is int ? value.toDouble() : value as double?;
  }
}

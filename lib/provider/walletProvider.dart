import 'package:hive/hive.dart';
import 'package:payapp/services/apis/apiservice.dart';
import '../core/services/hiveDatabase.dart';
import '../src/src.dart';

class WalletProvider extends ChangeNotifier {
  WalletsModel? walletModel;
  List<WalletTransactionModel>? walletTransactionModel;
  List<BankModel> savedBanks = [];
  bool loading = false;

  Future getWalletDetails({required String userId}) async {
    loading = true;
    walletModel = await ApiService.fetchWallet(userId: userId);
    loading = false;
    notifyListeners();
  }

  Future<List<dynamic>> getAllTransactionDetails() async {
    loading = true;
    List<dynamic> list = await ApiService.fetchTransactionData();
    loading = false;

    notifyListeners();
    return list;
  }

  Future addBank({required BankModel bankModel}) async {
    Box box = await HiveDataBase.openBox(boxName: HiveConfig.savedBanks);
    final value = await ApiService.addBankDetails(data: bankModel.toMap())
        .then((value) async {
      await HiveDataBase.saveData(box, [bankModel.toMap()]);
      getBanks();
      return value;
    }).onError((error, stackTrace) {
      return Future.error(error.toString());
    });
    return value;
  }

  Future getBanks() async {
    Box box = await HiveDataBase.openBox(boxName: HiveConfig.savedBanks);
    final value = await HiveDataBase.getData(box).then((value) {
      final banks = value as List;
      savedBanks =
          banks.map((e) => BankModel.fromMap(e)).toList().reversed.toList();
      notifyListeners();
      return savedBanks;
    }).onError((error, stackTrace) => Future.error("$error"));
    box.close();
    return value;
  }
}

import 'package:get/get.dart';
import 'package:payapp/data/model/body/wallet_filter_body.dart';
import 'package:payapp/data/model/response/fund_bonus_body.dart';
import 'package:payapp/data/model/response/wallet_model.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;
import '../src/src.dart';

class WalletController extends GetxController implements GetxService {
  final WalletRepo walletRepo;
  WalletController({required this.walletRepo});

  List<Transaction>? _transactionList;
  List<String> _offsetList = [];
  int _offset = 1;
  int? _pageSize;
  bool _isLoading = false;
  String? _digitalPaymentName;
  bool _amountEmpty = true;
  List<FundBonusBody>? _fundBonusList;
  int _currentIndex = 0;
  String _type = 'all';
  List<WalletFilterBody> _walletFilterList = [];

  var walletLoading = false.obs;

  var walletBalance = Rxn<WalletBalanceModel?>(null);
  var transactionHistory = Rxn<TransactionHistoryModel?>(null);

  List<Transaction>? get transactionList => _transactionList;
  int? get popularPageSize => _pageSize;
  bool get isLoading => _isLoading;
  int get offset => _offset;
  String? get digitalPaymentName => _digitalPaymentName;
  bool get amountEmpty => _amountEmpty;
  List<FundBonusBody>? get fundBonusList => _fundBonusList;
  int get currentIndex => _currentIndex;
  String get type => _type;
  List<WalletFilterBody> get walletFilterList => _walletFilterList;

  void setWalletFilerType(String type, {bool isUpdate = true}) {
    _type = type;
    if (isUpdate) {
      update();
    }
  }

  @override
  onInit() {
    fetchWalletBalance();
    fetchTransactionHistory();
    super.onInit();
  }

  Future<void> fetchWalletBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppConstants.walletBalanceAPIUrl);

    walletLoading.value = true;
    try {
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      printThis("Wallet API response $data");
      if (response.statusCode == 200) {
        walletLoading.value = false;
        walletBalance.value = WalletBalanceModel.fromJson(data);
        printThis("wallet bALANCE ${walletBalance.value?.data}");
      } else {
        walletLoading.value = false;
        throw Exception(
            'Failed to fetch Wallet Balance. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      walletLoading.value = false;
      debugPrint('Error fetching  Wallet Balance: $e');
    }
  }

  Future<void> fetchTransactionHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppConstants.transactionHistoryAPIUrl);

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        printThis("Transaction History API response $data");
        transactionHistory.value = TransactionHistoryModel.fromJson(data);

        printThis("Transaction History  ${transactionHistory.value?.data}");
      } else {
        throw Exception(
            'Failed to fetch Transaction History. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching Transaction History: $e');
    }
  }

  void insertFilterList() {
    _walletFilterList = [];
    for (int i = 0; i < AppConstants.walletTransactionSortingList.length; i++) {
      _walletFilterList.add(WalletFilterBody.fromJson(
          AppConstants.walletTransactionSortingList[i]));
    }
  }

  void changeDigitalPaymentName(String name, {bool isUpdate = true}) {
    _digitalPaymentName = name;
    if (isUpdate) {
      update();
    }
  }

  void isTextFieldEmpty(String value, {bool isUpdate = true}) {
    _amountEmpty = value.isNotEmpty;
    if (isUpdate) {
      update();
    }
  }

  void setOffset(int offset) {
    _offset = offset;
  }

  void showBottomLoader() {
    _isLoading = true;
    update();
  }

  Future<void> getWalletTransactionList(
      String offset, bool reload, bool isWallet, String walletType) async {
    if (offset == '1' || reload) {
      _offsetList = [];
      _offset = 1;
      _transactionList = null;
      if (reload) {
        update();
      }
    }
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);
      Response response;
      if (isWallet) {
        response =
            await walletRepo.getWalletTransactionList(offset, walletType);
      } else {
        response = await walletRepo.getLoyaltyTransactionList(offset);
      }

      if (response.statusCode == 200) {
        if (offset == '1') {
          _transactionList = [];
        }
        _transactionList!.addAll(WalletModel.fromJson(response.body).data!);
        _pageSize = WalletModel.fromJson(response.body).totalSize;

        _isLoading = false;
        update();
      } else {
        ApiChecker.checkApi(response);
      }
    } else {
      if (isLoading) {
        _isLoading = false;
        update();
      }
    }
  }

  Future<void> pointToWallet(int point, bool fromWallet) async {
    _isLoading = true;
    update();
    Response response = await walletRepo.pointToWallet(point: point);
    if (response.statusCode == 200) {
      Get.back();
      setWalletFilerType('all');
      getWalletTransactionList('1', true, fromWallet, 'all');
      Get.find<UserController>().getUserInfo();
      showCustomSnackBar('converted_successfully_transfer_to_your_wallet'.tr,
          isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> addFundToWallet(double amount, String paymentMethod) async {
    _isLoading = true;
    update();
    Response response = await walletRepo.addFundToWallet(amount, paymentMethod);
    if (response.statusCode == 200) {
      String redirectUrl = response.body['redirect_link'];
      Get.back();
      if (GetPlatform.isWeb) {
        html.window.open(redirectUrl, "_self");
      } else {
        Get.toNamed(RouteHelper.getPaymentRoute('0', 0, '', 0, false, '',
            addFundUrl: redirectUrl));
      }
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> getWalletBonusList({bool isUpdate = true}) async {
    _isLoading = true;
    if (isUpdate) {
      update();
    }

    Response response = await walletRepo.getWalletBonusList();
    if (response.statusCode == 200) {
      _fundBonusList = [];
      response.body.forEach((value) {
        _fundBonusList!.add(FundBonusBody.fromJson(value));
      });

      _isLoading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }

  void setWalletAccessToken(String accessToken) {
    walletRepo.setWalletAccessToken(accessToken);
  }

  String getWalletAccessToken() {
    return walletRepo.getWalletAccessToken();
  }
}

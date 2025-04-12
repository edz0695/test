import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

import '../../src/src.dart';

String body = "";
String callback = "https://webhook.site/b7ad762c-b0e7-4772-a603-c9ec045b6b54";
String checksum = "";

Map<String, String> headers = {};
List<String> environmentList = <String>['SANDBOX', 'PRODUCTION'];
bool enableLogs = true;
Object? result;
String environmentValue = 'SANDBOX';
String appId = "";
String merchantId = "PGTESTPAYUAT86";
String packageName = "com.sambhavapps.sambhav";
String saltKey = "96434309-7796-489d-8924-ab56988a6076";
int saltIndex = 1;
String apiEndPoint = "/pg/v1/pay";

void phonepeInit() {
  PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
      .then((val) => {result = 'PhonePe SDK Initialized - $val'})
      .catchError((error) {
    debugPrint(error);
    // ignore: invalid_return_type_for_catch_error
    return <dynamic>{};
  });
}

Future startTransaction(String price) async {
  final body = getCheckSum(price).toString();
  debugPrint("Transaction Request Body: $body");

  try {
    final response = await PhonePePaymentSdk.startTransaction(
      body,
      callback,
      checksum,
      packageName,
    );

    if (response != null) {
      final status = response['status']?.toString() ?? 'UNKNOWN';
      final error = response['error']?.toString() ?? 'No Error';

      if (status == 'SUCCESS') {
        result = "Flow Completed - Status: Success!";
      } else {
        result = "Flow Completed - Status: $status and Error: $error";
      }
    } else {
      result = "Flow Incomplete";
    }
  } catch (error) {
    debugPrint("Transaction Error: $error");

    result = "Transaction Failed";
  }
}

String generateRandomString(int length) {
  const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();

  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}

String getCheckSum(String price) {
  RegExp regExp = RegExp(r'₹\s?(\d+)');
  debugPrint((regExp.firstMatch(price)?.group(1)).toString());
  final data = {
    "merchantId": merchantId,
    "merchantTransactionId": generateRandomString(18),
    "merchantUserId": "MUID123",
    "amount": (int.parse((regExp.firstMatch(price)?.group(1) ?? "0")) * 100),
    "callbackUrl": callback,
    "mobileNumber": "9999999999",
    "paymentInstrument": {"type": "PAY_PAGE"}
  };
  String base64Body = base64.encode(utf8.encode(json.encode(data)));

  checksum =
      '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';

  return base64Body;
}

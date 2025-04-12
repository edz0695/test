import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/src/src.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:provider/provider.dart';
import '../ui/widgets/app_bar_widget.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget(
      {super.key, required this.cartItems, required this.price});
  final List<CartItem> cartItems;
  final String price;

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
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

  int convertDecimalToInteger(double value) {
    return (value * 100).round();
  }

  @override
  void initState() {
    phonepeInit();
    body = getCheckSum().toString();
    super.initState();
  }

  void phonepeInit() {
    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
        .then((val) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $val';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  Future startTransaction() async {
    final body = getCheckSum().toString();
    debugPrint("Transaction Request Body: $body");

    try {
      final response = await PhonePePaymentSdk.startTransaction(
        body,
        callback,
        checksum,
        packageName,
      );

      if (response != null) {
        setState(() {
          final status = response['status']?.toString() ?? 'UNKNOWN';
          final error = response['error']?.toString() ?? 'No Error';

          if (status == 'SUCCESS') {
            result = "Flow Completed - Status: Success!";
          } else {
            result = "Flow Completed - Status: $status and Error: $error";
          }
        });
      } else {
        setState(() {
          result = "Flow Incomplete";
        });
      }
    } catch (error) {
      debugPrint("Transaction Error: $error");
      setState(() {
        result = "Transaction Failed";
      });
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

  String getCheckSum() {
    RegExp regExp = RegExp(r'₹\s?(\d+)');
    print("Price ${(regExp.firstMatch(widget.price)!.group(1)).toString()}");
    final data = {
      "merchantId": merchantId,
      "merchantTransactionId": generateRandomString(18),
      "merchantUserId": "MUID123",
      "amount":
          (int.parse((regExp.firstMatch(widget.price)!.group(1) ?? "2")) * 100),
      "callbackUrl": callback,
      "mobileNumber": "9999999999",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };
    String base64Body = base64.encode(utf8.encode(json.encode(data)));

    checksum =
        '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';

    return base64Body;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PODController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.backgroundLightBlue,
      appBar: const AppBarWidget(
        title: "Pay",
        size: 55,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Card(
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/card.png"),
                          Text(
                            "Total amount for pay",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            widget.price,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height(50),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Consumer<LoginSignUpProvider>(
                        builder: (context, user, child) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () async {
                          await startTransaction().then((value) {
                            final data = user.userModel!;
                            print("VALUE $value");
                            final List<Map<String, dynamic>> products =
                                widget.cartItems.map((item) {
                              return {
                                "product": item.itemId,
                                "size": item.size.id,
                                "color": item.color.id,
                                "quantity": item.quantity,
                                "price": item.price
                              };
                            }).toList();
                            final Map<String, dynamic> json = {
                              "products": products,
                              "coupon": "507f1f77bcf86cd799439011",
                              "discount": "10",
                              "final_sale_amount": widget.price.toString(),
                              "delivery_street_address": "India",
                              "delivery_locality": "Jhirkand",
                              "delivery_pincode": 123456,
                              "delivery_mobile": data.mobile,
                              "delivery_recieving_person_name": data.name,
                              "status": "Pending",
                              "payment_id": generateRandomString(20).toString(),
                              "buyer": data.id
                            };
                            if (value != null) {
                              controller.placeOrderAPI(json);
                            }
                          });
                        },
                        child: const Card(
                          shape: StadiumBorder(),
                          color: Colors.indigo,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                  // height(50),
                  // ElevatedButton.icon(
                  //     icon: const Icon(
                  //       Icons.credit_card,
                  //       color: Colors.white,
                  //     ),
                  //     onPressed: () async => await startTransaction(),
                  //     style: ElevatedButton.styleFrom(
                  //         minimumSize: const Size(double.infinity, 50),
                  //         backgroundColor: Colors.indigo),
                  //     label: Text(
                  //       "Proceed To Pay",
                  //       style: GoogleFonts.poppins(
                  //           fontWeight: FontWeight.bold, color: Colors.white),
                  //     )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleError(error) {
    result = error;
  }
}

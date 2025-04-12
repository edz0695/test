import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../../../../../core/components/print_text.dart';
import '../../../../../../../core/components/tab_indicator.dart';
import '../../../../../../../core/views/kslistviewbuilder.dart';
import '../../../../../../../themes/colors.dart';
import 'package:http/http.dart' as http;

class OldStudentLeads extends StatefulWidget {
  const OldStudentLeads({super.key});

  @override
  State<OldStudentLeads> createState() => _OldStudentLeadsState();
}

class _OldStudentLeadsState extends State<OldStudentLeads>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late var _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    printThis("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    printThis("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    printThis("Payment Fail");
  }

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  static String basicAuth =
      'Basic ${base64.encode(utf8.encode('mygromoapp:SacPass112233'))}';

  static Future<Map> fetchAllLeads(BuildContext context) async {
    final pro  = Provider.of<LoginSignUpProvider>(context,listen: false);
    var url = Uri.parse("https://sambhavapps.com/admin/api/student-leads");
    final http.Response response =
    await http.post(url,body: {"user_id":pro.userModel!.id}, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData ;
      printThis(data);
      return  responseData;
    } else {
      return{};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(title: "Student Leads", size: 55),
      body: Column(
        children: [
          Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3, 3),
                          color: const Color(0xff2057A6).withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          text: "Leads",
                        ),
                        Tab(
                          text: "Packs",
                        ),
                      ],
                      labelStyle: GoogleFonts.poppins(),
                      labelColor: ThemeColors.primaryBlueColor,
                      splashBorderRadius: BorderRadius.circular(10),
                      indicator: const CvTabIndicator(
                        indicatorHeight: 4,
                        indicatorColor: ThemeColors.primaryBlueColor,
                        indicatorSize: CvTabIndicatorSize.normal,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
        Expanded(
          child: FutureBuilder<Map>(
          future: fetchAllLeads(context),
    builder: (_, snapshot) {
    if(snapshot.hasData){
      return TabBarView(
          controller: _tabController,
          children: [
            KSListView(
              itemCount: snapshot.data!['leads'].length,
              itemBuilder: (context, index) {
                return Container(
                  // height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(3, 3),
                        color: const Color(0xff2057A6).withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            // ClipRRect(
                            //     borderRadius: BorderRadius.circular(10),
                            //     child: Image.network(
                            //       Constants.forImg +
                            //           offer[index].bannerImage,
                            //       height: 80,
                            //       width: 80,
                            //       fit: BoxFit.cover,
                            //     )),
                            // SizedBox(
                            //   width: 15,
                            // ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                mainAxisAlignment: MainAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    "${snapshot.data!['leads'][index]['lead_count']} Leads",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    snapshot.data!['leads'][index]['date'].toString(),
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 10),
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),


                                  Align(
                                    alignment: Alignment
                                        .bottomRight,
                                    child: Text(
                                      "₹ ${snapshot.data!['leads'][index]['price']}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight
                                              .w500,
                                          color: ThemeColors
                                              .primaryBlueColor),
                                      maxLines: 1,
                                      overflow: TextOverflow
                                          .ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
              separateSpace: 15,
            ),

            KSListView(
              itemCount: snapshot.data!['packs'].length,
              itemBuilder: (context, index) {
                return Container(
                  // height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(3, 3),
                        color: const Color(0xff2057A6).withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      highlightColor: Colors.transparent,
                      onTap: () {
                        var options = {
                          'key': "rzp_test_xvlZZBGCo0SzL0",
                          // amount will be multiple of 100
                          'amount': (int.parse(snapshot.data!['packs'][index]['price'].toString()) * 100)
                              .toString(), //So its pay 500
                          'name': 'Code With Patel',
                          'description': 'Demo',
                          'timeout': 300, // in seconds
                          'prefill': {
                            'contact': '8787878787',
                            'email': 'codewithpatel@gmail.com'
                          }
                        };
                        _razorpay.open(options);

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            // ClipRRect(
                            //     borderRadius: BorderRadius.circular(10),
                            //     child: Image.network(
                            //       Constants.forImg +
                            //           offer[index].bannerImage,
                            //       height: 80,
                            //       width: 80,
                            //       fit: BoxFit.cover,
                            //     )),
                            // SizedBox(
                            //   width: 15,
                            // ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                mainAxisAlignment: MainAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    snapshot.data!['packs'][index]['lead_count'],
                                    style: GoogleFonts.poppins(
                                        color: Colors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),



                                  Align(
                                    alignment: Alignment
                                        .bottomRight,
                                    child: Text(
                                      "₹ ${snapshot.data!['packs'][index]['price'].toString()}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight
                                              .w500,
                                          color: ThemeColors
                                              .primaryBlueColor),
                                      maxLines: 1,
                                      overflow: TextOverflow
                                          .ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
              separateSpace: 15,
            )
          ],
      );
    }

            return const Center(child: CircularProgressIndicator(),);
    }),
        ),
                  
                ],
              )),
        ],
      ),
    );
  }
}

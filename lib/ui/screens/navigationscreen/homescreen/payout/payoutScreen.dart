import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/payout/payoutForm.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/payout/payoutHistorypage.dart';

import '../../../../../core/components/tab_indicator.dart';
import '../../../../../themes/colors.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({super.key});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(200),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_left,
                              size: 25,
                            ),
                          )),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "PayOut",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, letterSpacing: 1),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
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
                  tabs: const [
                    Tab(
                      text: "Pay",
                    ),
                    Tab(
                      text: "History",
                    ),
                  ],
                  labelStyle: GoogleFonts.poppins(),
                  labelColor: ThemeColors.primaryBlueColor,
                  // indicatorPadding: EdgeInsets.symmetric(horizontal: 10,),
                  splashBorderRadius: BorderRadius.circular(10),
                  indicator: const CvTabIndicator(
                    indicatorHeight: 3,
                    indicatorColor: ThemeColors.primaryBlueColor,
                    indicatorSize: CvTabIndicatorSize.normal,
                  ),
                  // indicator: CircleTabIndicator(color: Colors.black, radius: 3),

                  // indicatorColor: Colors.green,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              const Expanded(
                  child: TabBarView(
                children: [
                  PayoutForm(
                    showForm: false,
                  ),
                  PayoutHistoryPage(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

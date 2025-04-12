import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/view/screens/referral_screens/add_new_referral.dart';
import 'package:payapp/view/screens/referral_screens/see_referral_leaderboard.dart';

import '../../../src/src.dart';

class ReferralMain extends StatefulWidget {
  const ReferralMain({super.key});

  @override
  State<ReferralMain> createState() => _ReferralMainState();
}

class _ReferralMainState extends State<ReferralMain> {
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: ThemeColors.backgroundLightBlue,
            appBar: AppBar(
              backgroundColor: ThemeColors.backgroundLightBlue,
              leading: back(),
              centerTitle: true,
              title: Text("REFER AND EARN",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Rewards Earned",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15, // Font size for selected label
                          fontWeight:
                              FontWeight.w500, // Font weight for selected label
                        ),
                      ),
                      Lottie.asset(
                        'assets/images/reward.json',
                        width: 45, // Set your desired width
                        height: 45, // Set your desired height
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
                  child: Container(
                    transform: Matrix4.translationValues(0, -10, 0),
                    child: const Text(
                      "₹ 1000",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20, // Font size for selected label
                        fontWeight:
                            FontWeight.w500, // Font weight for selected label
                      ),
                    ),
                  ),
                ),
                TabBar(
                    labelColor: const Color(0xFF0496C7), // Selected label color
                    unselectedLabelColor:
                        Colors.grey.shade500, // Unselected label color
                    indicatorColor: const Color(0xFF0496C7),
                    dividerColor: Colors.grey.shade300,
                    labelPadding: const EdgeInsets.only(
                        bottom: 12), // No padding around the indicator
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: const TextStyle(
                      fontSize: 16, // Font size for selected label
                      fontWeight:
                          FontWeight.w500, // Font weight for selected label
                    ),
                    indicatorWeight: 2.0,
                    tabs: const [
                      Text(
                        "Invite",
                      ),
                      Text("Referrals")
                    ]),
                const Expanded(
                  child: TabBarView(children: [
                    AddNewReferral(),
                    ReferralLeaderBoard(),
                  ]),
                )
              ],
            )));
  }
}

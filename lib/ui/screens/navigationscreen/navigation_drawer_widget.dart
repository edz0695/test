import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/config/route_config.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import 'package:payapp/models/drawer_tile_model.dart';
import 'package:payapp/ui/screens/navigationscreen/components/supportWidgetForNavDrawer.dart';
import 'package:payapp/ui/screens/navigationscreen/profilescreen/termsconditions/termsconditions.dart';
import 'package:payapp/view/screens/coupon/coupon_screen.dart';
import 'package:payapp/view/screens/referral_screens/referral_main.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/model/body/notification_body.dart';
import '../../../provider/loginSignUpProvider.dart';
import '../../../provider/setingsProvider.dart';
import '../../../view/screens/auth/delivery_man_registration_screen.dart';
import '../../../view/screens/auth/sign_in_screen.dart';
import '../../../view/screens/auth/store_registration_screen.dart';
import 'homescreen/accountmanager/accountmanager.dart';
import 'homescreen/walletScreen/savedBankAccountScreen.dart';
import 'homescreen/walletScreen/walletScreen.dart';
import 'pod_services/print_on_demand_screen.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget(
      {super.key, required this.languages, required this.body});

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  _navigateToPage(BuildContext context, ActionType actionType) {
    Scaffold.of(context).closeDrawer();

    switch (actionType) {
      case ActionType.coupon:
        Get.to(() => const CouponScreen());
        break;
      case ActionType.joinAsDeliveryMan:
        Get.to(() => const DeliveryManRegistrationScreen());
        break;
      case ActionType.openStore:
        Get.to(() => const StoreRegistrationScreen());
        break;
      case ActionType.accountManager:
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => const AccountManagerScreen()));
        break;
      case ActionType.myReferrals:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const ReferralMain()));
        break;
      case ActionType.myBankAccount:
        Navigator.push(
            context,
            CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => SelectBankScreen(
                      languages: widget.languages,
                      body: widget.body,
                    )));
        break;
      case ActionType.mpin:
        break;
      case ActionType.myEarnings:
        final loginSignupProvider =
            Provider.of<LoginSignUpProvider>(context, listen: false);
        if (loginSignupProvider.userModel != null) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => WalletScreen(
                        languages: widget.languages,
                        body: widget.body,
                      )));
        } else {
          Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) =>
                    const SignInScreen(exitFromApp: false, backFromThis: true),
              ));
        }
        break;
      case ActionType.myReferrals:
        break;
      case ActionType.changeLanguage:
        break;
      case ActionType.joinTelegram:
        break;
      case ActionType.rateUs:
        break;
      case ActionType.aboutApp:
        final provider = Provider.of<SettingsProvider>(context, listen: false);
        void openUrl() async {
          const url = 'https://sambhavapps.com/about-us/';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        }

        openUrl();

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => TermsAndConditionsScreen(
        //               termsConditions: provider.settingsModel != null
        //                   ? provider.settingsModel!.aboutUs
        //                   : "",
        //               title: "About Us.",
        //             )));
        break;
      case ActionType.tdsDeduction:
        final provider = Provider.of<SettingsProvider>(context, listen: false);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TermsAndConditionsScreen(
                      termsConditions: provider.settingsModel != null
                          ? provider.settingsModel!.tdsInfo
                          : "",
                      title: "TDS Deduction Info",
                    )));
        break;
      case ActionType.privacyPolicy:
        final provider = Provider.of<SettingsProvider>(context, listen: false);
        void openUrl() async {
          const url = 'https://sambhavapps.com/privacy-policy';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        }

        openUrl();

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => TermsAndConditionsScreen(
        //               termsConditions: provider.settingsModel != null
        //                   ? provider.settingsModel!.privacyPolicy
        //                   : "",
        //               title: "Privacy Policy",
        //             )));
        break;
      case ActionType.termsConditions:
        final provider = Provider.of<SettingsProvider>(context, listen: false);

        void openUrl() async {
          const url = 'https://sambhavapps.com/terms-and-conditions';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        }

        openUrl();

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => TermsAndConditionsScreen(
        //               termsConditions: provider.settingsModel != null
        //                   ? provider.settingsModel!.privacyPolicy
        //                   : "",
        //               title: "Terms & Conditions",
        //             )));
        break;
      case ActionType.logout:
        final loginSignUpProvider =
            Provider.of<LoginSignUpProvider>(context, listen: false);
        loginSignUpProvider.logOutUser();
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
                builder: (context) => const SignInScreen(
                    exitFromApp: false, backFromThis: false)),
            (route) => false);
        break;
      case ActionType.support:
        break;
      case ActionType.pOD:
        RouteConfig.navigateToLTR(context, PODFactoryScreen());
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    final enableItems =
        drawerTiles.where((element) => element.actionType != null).toList();
    final disableItems =
        drawerTiles.where((element) => element.actionType == null).toList();
    drawerTiles = enableItems + disableItems;
    // drawerTiles.sort((a, b) => a.label.toString().compareTo(b.label.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF7F7F7),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: double.infinity,
            height: 175,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.indigo,
                Colors.indigoAccent.shade200,
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Consumer<LoginSignUpProvider>(
                builder: (context, value, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: CircleAvatar(
                          backgroundImage: value.userModel!.image.isNotEmpty
                              ? NetworkImage(value.userModel!.image)
                              : const AssetImage(
                                  "assets/images/avatar.png",
                                ),
                        ),
                      ),
                      width(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height(40),
                          Text(
                            value.userModel!.name,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          height(3),
                          Text(
                            value.userModel!.email,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          height(10),
          Column(
            children: List.generate(
                drawerTiles.length,
                (index) => drawerTiles[index].actionType == ActionType.support
                    ? SupportWidgetForNavDrawer(
                        label: drawerTiles[index].label,
                        icon: drawerTiles[index].icon,
                      )
                    : ListTile(
                        title: Text(
                          drawerTiles[index].label,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff2D2A26)),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 25),
                        iconColor: const Color(0xff2D2A26),
                        style: ListTileStyle.drawer,
                        enabled: drawerTiles[index].actionType == null
                            ? false
                            : true,
                        leading: Icon(
                          drawerTiles[index].icon,
                          color: Colors.indigo,
                        ),
                        onTap: () {
                          if (drawerTiles[index].actionType != null) {
                            _navigateToPage(
                                context, drawerTiles[index].actionType!);
                          } else {
                            showScaffold(context, "hello");
                          }
                        },
                      )),
          )
        ],
      ),
    );
  }
}

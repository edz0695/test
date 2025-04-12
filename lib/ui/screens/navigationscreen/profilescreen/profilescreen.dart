import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/config/apiconfig.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/provider/setingsProvider.dart';
import 'package:payapp/ui/screens/navigationscreen/profilescreen/editprofilescreen/editprofilescreen.dart';
import 'package:payapp/ui/screens/navigationscreen/profilescreen/termsconditions/termsconditions.dart';
import 'package:payapp/view/screens/auth/sign_in_screen.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helper/helper.dart';
import '../../../../data/model/body/notification_body.dart';
import '../../../../models/drawer_tile_model.dart';
import '../../../../themes/colors.dart';
import '../../../../view/screens/auth/delivery_man_registration_screen.dart';
import '../../../../view/screens/auth/store_registration_screen.dart';
import '../../../../view/screens/coupon/coupon_screen.dart';
import '../homescreen/accountmanager/accountmanager.dart';
import '../homescreen/walletScreen/savedBankAccountScreen.dart';
import '../homescreen/walletScreen/walletScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.languages, required this.body});
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<DrawerTileModel> drawerTiles = [
    DrawerTileModel(
      label: "Personal Manager",
      svgIcon: "",
      actionType: ActionType.accountManager,
      icon: Icons.support_agent_outlined,
    ),
    DrawerTileModel(
      label: "Linked Bank Accounts ",
      svgIcon: "",
      // actionType: null,
      actionType: ActionType.myBankAccount,
      icon: Icons.account_balance_outlined,
    ),
    DrawerTileModel(
      label: "MPIN",
      svgIcon: "",
      actionType: null,
      icon: Icons.password_rounded,
    ),
    DrawerTileModel(
      label: "My Earnings",
      svgIcon: "",
      // actionType: null,
      actionType: ActionType.myEarnings,
      icon: Icons.money,
    ),
    DrawerTileModel(
      label: "My Referrals",
      svgIcon: "",
      actionType: null,
      icon: Icons.share_sharp,
    ),
    DrawerTileModel(
      label: "Change Language",
      svgIcon: "",
      actionType: null,
      icon: Icons.language_outlined,
    ),
    DrawerTileModel(
      label: "Join Telegram",
      svgIcon: "",
      actionType: null,
      icon: Icons.telegram,
    ),
    DrawerTileModel(
      label: "Coupon",
      svgIcon: "",
      actionType: ActionType.coupon,
      icon: Icons.discount,
    ),
    DrawerTileModel(
      label: "Join as a Delivery Man",
      svgIcon: "",
      actionType: ActionType.joinAsDeliveryMan,
      icon: Icons.delivery_dining,
    ),
    DrawerTileModel(
      label: "Open Store",
      svgIcon: "",
      actionType: ActionType.openStore,
      icon: Icons.store,
    ),
    // DrawerTileModel(
    //   label: "Rate Us",
    //   svgIcon: "",
    //   actionType: null,
    //   icon: Icons.star_rate_outlined,),
    // DrawerTileModel(
    //   label: "About Sambhav App",
    //   svgIcon: "",
    //   actionType: ActionType.aboutApp,
    //   icon: Icons.info_outline,),
    // DrawerTileModel(
    //   label: "TDS Deduction Info",
    //   svgIcon: "",
    //   actionType: ActionType.tdsDeduction,
    //   icon: Icons.sticky_note_2_outlined,),
    // DrawerTileModel(
    //   label: "Privacy & Policy",
    //   svgIcon: "",
    //   actionType: ActionType.privacyPolicy,
    //   icon: Icons.policy,),
    // DrawerTileModel(
    //   label: "Terms & Conditions",
    //   svgIcon: "",
    //   actionType: ActionType.termsConditions,
    //   icon: Icons.document_scanner,),
  ];
  List<DrawerTileModel> drawerTilesSecond = [
    DrawerTileModel(
      label: "Rate Us",
      svgIcon: "",
      actionType: null,
      icon: Icons.star_rate_outlined,
    ),
    DrawerTileModel(
      label: "About Sambhav App",
      svgIcon: "",
      actionType: ActionType.aboutApp,
      icon: Icons.info_outline,
    ),
    DrawerTileModel(
      label: "TDS Deduction Info",
      svgIcon: "",
      actionType: ActionType.tdsDeduction,
      icon: Icons.sticky_note_2_outlined,
    ),
    DrawerTileModel(
      label: "Privacy & Policy",
      svgIcon: "",
      actionType: ActionType.privacyPolicy,
      icon: Icons.policy,
    ),
    DrawerTileModel(
      label: "Terms & Conditions",
      svgIcon: "",
      actionType: ActionType.termsConditions,
      icon: Icons.document_scanner,
    ),
  ];

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
      case ActionType.myBankAccount:
        Navigator.push(
          context,
          CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => SelectBankScreen(
                    languages: widget.languages,
                    body: widget.body,
                  )),
        );
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
                  const SignInScreen(exitFromApp: true, backFromThis: true),
            ),
          );
        }
        break;
      case ActionType.myReferrals:
        // TODO: Handle this case.
        break;
      case ActionType.changeLanguage:
        // TODO: Handle this case.
        break;
      case ActionType.joinTelegram:
        // TODO: Handle this case.
        break;
      case ActionType.rateUs:
        // TODO: Handle this case.
        break;
      case ActionType.aboutApp:
        final provider = Provider.of<SettingsProvider>(context, listen: false);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TermsAndConditionsScreen(
              termsConditions: provider.settingsModel != null
                  ? provider.settingsModel!.aboutUs
                  : "",
              title: "About Us.",
            ),
          ),
        );
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
            ),
          ),
        );
        break;
      case ActionType.privacyPolicy:
        final provider = Provider.of<SettingsProvider>(context, listen: false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TermsAndConditionsScreen(
              termsConditions: provider.settingsModel != null
                  ? provider.settingsModel!.privacyPolicy
                  : "",
              title: "Privacy Policy",
            ),
          ),
        );
        break;
      case ActionType.termsConditions:
        final provider = Provider.of<SettingsProvider>(context, listen: false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TermsAndConditionsScreen(
              termsConditions: provider.settingsModel != null
                  ? provider.settingsModel!.privacyPolicy
                  : "",
              title: "Terms & Conditions",
            ),
          ),
        );
        break;
      case ActionType.logout:
        // TODO: Handle this case.
        break;
      case ActionType.support:
        // TODO: Handle this case.
        break;
      case ActionType.pOD:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ThemeColors.primaryBlueColor,
          statusBarIconBrightness: Brightness.light,
        ),
        // flexibleSpace:
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 270,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff337FC9),
                          Color(0xff2057A6),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    left: 25,
                    right: 25,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20.0),
                          ],
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          child: Consumer<LoginSignUpProvider>(
                            builder: (context, loginSignupProvider, child) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(20),
                                highlightColor: Colors.transparent,
                                splashColor: ThemeColors.primaryBlueColor
                                    .withOpacity(.05),
                                onTap: loginSignupProvider.userModel == null
                                    ? null
                                    : () async {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const EditProfileScreen()),
                                        );
                                      },
                                child: loginSignupProvider.userModel != null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors.blueAccent,
                                                  width: .5),
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                            ),
                                            child: loginSignupProvider.loading
                                                ? const ShimmerAnimation(
                                                    radius: 1000)
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1000),
                                                    child: Image.network(
                                                      "${Constants.forImg}/${loginSignupProvider.userModel!.image}",
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (
                                                        BuildContext context,
                                                        Object _,
                                                        StackTrace? __,
                                                      ) {
                                                        return const Icon(
                                                            Icons.person,
                                                            color: Colors.black,
                                                            size: 50);
                                                      },
                                                    ),
                                                  ),
                                          ),
                                          const SizedBox(height: 15),
                                          loginSignupProvider.loading
                                              ? const ShimmerAnimation(
                                                  radius: 1000,
                                                  height: 10,
                                                  width: 100)
                                              : Text(
                                                  loginSignupProvider
                                                      .userModel!.name
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: .5),
                                                ),
                                          const SizedBox(height: 5),
                                          loginSignupProvider.loading
                                              ? const ShimmerAnimation(
                                                  radius: 1000,
                                                  height: 10,
                                                  width: 200)
                                              : Text(
                                                  loginSignupProvider
                                                      .userModel!.email,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors.blueAccent,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                              child: Icon(
                                                Icons.login,
                                                color: Colors.black
                                                    .withOpacity(.7),
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 50,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    ThemeColors
                                                        .primaryBlueColor,
                                                    Colors.blueAccent,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                              color:
                                                  ThemeColors.primaryBlueColor,
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.black12,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                        fullscreenDialog: true,
                                                        builder: (context) =>
                                                            const SignInScreen(
                                                                exitFromApp:
                                                                    true,
                                                                backFromThis:
                                                                    true)

                                                        //     LoginScreen(
                                                        //   fromInside: true,
                                                        //   languages:
                                                        //       widget.languages,
                                                        //   body: widget.body,
                                                        // ),
                                                        ),
                                                  );
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Login",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: SafeArea(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(1000),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: ThemeColors.primaryBlueColor.withOpacity(.1),
                      blurRadius: 10)
                ],
              ),
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: drawerTiles.length + 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? InkWell(
                          onTap: () {
                            final loginSignupProvider =
                                Provider.of<LoginSignUpProvider>(context,
                                    listen: false);
                            if (loginSignupProvider.userModel != null) {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const EditProfileScreen()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => const SignInScreen(
                                        exitFromApp: true, backFromThis: true)),
                              );
                            }
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.035),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: Icon(Icons.edit)),
                                  Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: drawerTiles[index - 1].actionType == null
                              ? null
                              : () {
                                  if (drawerTiles[index - 1].actionType !=
                                      null) {
                                    _navigateToPage(context,
                                        drawerTiles[index - 1].actionType!);
                                  } else {
                                    showScaffold(context, "hello");
                                  }
                                },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.035),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Icon(drawerTiles[index - 1].icon)),
                                  Text(
                                    drawerTiles[index - 1].label,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
            // SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: ThemeColors.primaryBlueColor.withOpacity(.1),
                      blurRadius: 10)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15),
                    child: Text(
                      "Other Links",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: drawerTilesSecond.length,
                    itemBuilder: (context, index) {
                      // if(index==0){
                      //   ;
                      // }
                      return InkWell(
                        onTap: drawerTiles[index].actionType == null
                            ? null
                            : () {
                                if (drawerTiles[index].actionType != null) {
                                  _navigateToPage(
                                      context, drawerTiles[index].actionType!);
                                } else {
                                  showScaffold(context, "hello");
                                }
                              },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.035),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Icon(drawerTiles[index].icon)),
                                Text(
                                  drawerTiles[index].label,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w100),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // ListView(
            //   padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            //   shrinkWrap: true,
            //   children: [
            //     ProfileListTile(
            //       title: "Kyc Update",
            //       icon: Iconsax.shield_tick5,
            //       onTap: () async {
            //         final loginSignUpProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
            //         if(loginSignUpProvider.userModel!=null){
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => KycScreen()));
            //         }
            //         else{
            //           Navigator.push(
            //               context,
            //               CupertinoPageRoute(
            //                 fullscreenDialog: true,
            //                 builder: (context) => const LoginScreen(fromInside: true,),));
            //         }
            //
            //       },
            //     ),
            //     ProfileListTile(
            //       title: "Privacy Policy",
            //       icon: Iconsax.shield_tick,
            //
            //         onTap: (){
            //
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => TermsAndConditionsScreen(termsConditions: provider.settingsModel!=null?provider.settingsModel!.privacyPolicy:"",title: "Privacy Policy",)));
            //
            //         },
            //
            //     ),
            //      ProfileListTile(
            //       title: "Terms & Conditions",
            //       icon: Iconsax.document,
            //       onTap: (){
            //
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => TermsAndConditionsScreen(termsConditions: provider.settingsModel!=null?provider.settingsModel!.termsConditions:"",title: 'Terms&Conditions',)));
            //
            //       },
            //
            //     ),
            //     const ProfileListTile(
            //       title: "Rate this App",
            //       icon: Iconsax.star,
            //
            //     ),
            //     ProfileListTile(
            //       title: "Log Out",
            //       icon: Iconsax.logout,onTap: () async {
            //         final loginSignUpProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
            //         loginSignUpProvider.logOutUser();
            //         Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=>LoginScreen()), (route) => false);
            //         // await LocalStorage.clearLocalDB();
            //     },
            //
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/config/apiconfig.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/provider/accountManagerProvider.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/widgets/detailswidget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/animations/shimmer_animation.dart';
import '../../../../../helper/constants.dart';

class AccountManagerScreen extends StatefulWidget {
  const AccountManagerScreen({super.key});

  @override
  State<AccountManagerScreen> createState() => _AccountManagerState();
}

class _AccountManagerState extends State<AccountManagerScreen> {
  _launchCaller(String mobile) async {
    final url = "tel:+91 $mobile";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      printThis("No");
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    final accountManagerProvider =
        Provider.of<AccountManagerProvider>(context, listen: false);
    accountManagerProvider.getManagerDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: back(),
        title: Text(
          "Account Manager",
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 230,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20.0,
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Colors.white),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF8F8F8),
                        borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.all(10),
                    child: Consumer<AccountManagerProvider>(
                        builder: (context, accountManagerProvider, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child:
                            accountManagerProvider.accountManagerModel == null
                                ? const ShimmerAnimation(
                                    height: 140,
                                    width: 140,
                                  )
                                : Image.network(
                                    Constants.forImg +
                                        accountManagerProvider
                                            .accountManagerModel!.image,
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: 140,
                                  ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              Consumer<AccountManagerProvider>(
                  builder: (context, accountManagerProvider, child) {
                return accountManagerProvider.accountManagerModel == null
                    ? const ShimmerAnimation(
                        height: 50,
                        radius: 10,
                      )
                    : DetailsWidget(
                        title: "Name",
                        detail:
                            accountManagerProvider.accountManagerModel!.name);
              }),
              const SizedBox(
                height: 10,
              ),
              Consumer<AccountManagerProvider>(
                  builder: (context, accountManagerProvider, child) {
                return accountManagerProvider.accountManagerModel == null
                    ? const ShimmerAnimation(
                        height: 50,
                        radius: 10,
                      )
                    : DetailsWidget(
                        title: "Email",
                        detail:
                            accountManagerProvider.accountManagerModel!.email);
              }),
              const SizedBox(
                height: 10,
              ),
              Consumer<AccountManagerProvider>(
                  builder: (context, accountManagerProvider, child) {
                return accountManagerProvider.accountManagerModel == null
                    ? const ShimmerAnimation(
                        height: 50,
                        radius: 10,
                      )
                    : DetailsWidget(
                        title: "Mobile",
                        detail:
                            accountManagerProvider.accountManagerModel!.mobile);
              }),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<AccountManagerProvider>(
                      builder: (context, accountManagerProvider, child) {
                    return accountManagerProvider.accountManagerModel == null
                        ? const ShimmerAnimation(
                            height: 50,
                            width: 150,
                            radius: 1000,
                          )
                        : Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                    colors: [
                                      ThemeColors.primaryBlueColor,
                                      Colors.blueAccent,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                color: ThemeColors.primaryBlueColor),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(1000),
                                highlightColor: Colors.transparent,
                                splashColor: Colors.black12,
                                onTap: () {
                                  _launchCaller(accountManagerProvider
                                      .accountManagerModel!.mobile);
                                },
                                child: Center(
                                  child: Text(
                                    "Call Now",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ),
                          );
                  }),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

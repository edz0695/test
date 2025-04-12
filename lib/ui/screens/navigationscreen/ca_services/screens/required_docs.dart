import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/payment_selection_screen.dart';

import '../../../../../config/route_config.dart';
import '../../../../../data/model/body/notification_body.dart';
import '../../../../../themes/colors.dart';
import '../../../../widgets/app_bar_widget.dart';

class RequiredDocsScreen extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  const RequiredDocsScreen(
      {super.key,
      required this.screenTitle,
      required this.languages,
      required this.body});

  final String screenTitle;

  @override
  State<RequiredDocsScreen> createState() => _RequiredDocsScreenState();
}

class _RequiredDocsScreenState extends State<RequiredDocsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade50,
      appBar: AppBarWidget(title: widget.screenTitle, size: 55),
      body: Column(
        children: [
          // Hero(
          //   tag: 'wertyuio',
          //   child : Consumer<CaServicesProvider>(builder:
          //       (context, caServiceProvider, child) {
          //     return Container(
          //       height: 220,
          //       padding: const EdgeInsets.symmetric(
          //           horizontal: 10, vertical: 10),
          //       width: double.infinity,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(20),
          //         child: caServiceProvider.isLoading
          //             ? const ShimmerAnimation()
          //             : Image.network(
          //           Constants.forImg +
          //               caServiceProvider
          //                   .serviceDetails!
          //                   .bannerImage[0]!,
          //           loadingBuilder: (
          //               BuildContext context,
          //               Widget child,
          //               ImageChunkEvent?
          //               loadingProgress,
          //               ) {
          //             if (loadingProgress == null) {
          //               return child;
          //             }
          //             return const ShimmerAnimation();
          //           },
          //           errorBuilder: (context, error,
          //               stackTrace) =>
          //           const ShimmerAnimation(),
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     );
          //   }),
          // ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 220,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 3),
                  color: const Color(0xff2057A6).withOpacity(0.2),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Required Docs',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet_membership_outlined,
                    color: ThemeColors.primaryBlueColor,
                    size: 35.0,
                  ),
                  title: Text(
                    'Adhar Card',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet_membership_outlined,
                    color: Colors.pinkAccent,
                    size: 35.0,
                  ),
                  title: Text(
                    'Adhar Visa',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet_membership_outlined,
                    color: Colors.green,
                    size: 35.0,
                  ),
                  title: Text(
                    'Adhar Card',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          RouteConfig.navigateToRTL(
              context,
              PaymentSelectionScreen(
                languages: widget.languages,
                body: widget.body,
              ));
        },
        label: const Text(
          '      Buy Now      ',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/components/app_decoration.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/feedback_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:lottie/lottie.dart';
import '../../../../../config/route_config.dart';
import '../../../../widgets/glass_effect.dart';

class OrderStatusDetails extends StatefulWidget {
  const OrderStatusDetails({super.key});

  @override
  State<OrderStatusDetails> createState() => _OrderStatusDetailsState();
}

class _OrderStatusDetailsState extends State<OrderStatusDetails>
    with SingleTickerProviderStateMixin {
  bool isPending = true;

  bool isDownloading = false;

  void download() {
    setState(() {
      isDownloading = true;
    });
    printThis(isDownloading.toString());
    Timer(const Duration(seconds: 15), () {
      setState(() {
        isDownloading = false;
        printThis(isDownloading.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepOrangeAccent[100],

      appBar: const AppBarWidget(title: 'Order Status Details', size: 55),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: appBoxDecoration(
                  border: const Border(),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/educationscreen/student_leed_item.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shadow: [],
                ),
              ),
              const SizedBox(height: 10),
              Builder(
                builder: (context) {
                  if (isPending) {
                    return GlassEffectedContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pending',
                                  style: GoogleFonts.poppins(
                                    color: ThemeColors.darkBlueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  'We Are Processing Your Order.\nPlease Wait For 24 Hours',
                                  maxLines: 5,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: ThemeColors.darkBlueColor
                                        .withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Lottie.asset('assets/lottie/pending.json',
                              width: 70,
                              reverse: true,
                              errorBuilder: (context, error, stackTrace) =>
                                  const SizedBox()),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlassEffectedContainer(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Success',
                                      style: GoogleFonts.poppins(
                                        color: ThemeColors.darkBlueColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'We’ve Successfully Submittded GST For The July Month Of Your Company Lund Pvt Ltd. Please Download The Docs, We’ve Successfully Submittded GST For The July Month Of Your Com',
                                        maxLines: 5,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ThemeColors.darkBlueColor
                                              .withOpacity(0.9),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Lottie.asset('assets/lottie/success.json',
                                  width: 70,
                                  reverse: true,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox()),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        GlassEffectedContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                height: 30,
                                child: Text(
                                  'Download your docs',
                                  style: GoogleFonts.poppins(
                                    color: ThemeColors.darkBlueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'GST Submission Confirmation Final',
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: ThemeColors.darkBlueColor
                                                  .withOpacity(0.9),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => download(),
                                            child: Lottie.asset(
                                                'assets/lottie/download_banner.json',
                                                animate: isDownloading
                                                    ? true
                                                    : false,
                                                width: 70,
                                                height: 70,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    const SizedBox()),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'INVOICE From MCA Final',
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: ThemeColors.darkBlueColor,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => download(),
                                            child: Lottie.asset(
                                                'assets/lottie/download_banner.json',
                                                width: 70,
                                                height: 70,
                                                animate: isDownloading
                                                    ? true
                                                    : false,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    const SizedBox()),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (isPending) {
              Get.snackbar(isPending ? 'Youuoh!' : 'Nice!', '',
                  messageText: Text(
                    isPending
                        ? 'Ok, no need to call customer service🤗 \n one second and your order will placed successfully.'
                        : 'Take this pending yoow😈😈',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800),
                  ),
                  isDismissible: true,
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: ThemeColors.darkBlueColor,
                  colorText: Colors.white,
                  borderRadius: 10,
                  animationDuration: const Duration(seconds: 1),
                  duration: const Duration(seconds: 8));
              setState(() {
                isPending = !isPending;
              });
            } else {
              RouteConfig.navigateTo(context, SendFeedBackScreen());
            }
          },
          label: Row(
            children: [
              Text(
                isPending
                    ? "Contact Customer Care".toUpperCase()
                    : "Write Feedback".toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                isPending ? Icons.earbuds_sharp : Icons.thumb_up,
                size: 30,
                color: Colors.white,
              ),
            ],
          )),
    );
  }
}

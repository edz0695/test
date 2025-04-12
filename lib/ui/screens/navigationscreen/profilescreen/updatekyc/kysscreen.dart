import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/core/animations/dot_loder_widget.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/themes/colors.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/helper/helper.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    super.initState();
  }

  File? aadharImage;
  File? panImage;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    InkWell(
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
                    Expanded(
                        child: Center(
                            child: Text(
                      "Update Kyc",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, letterSpacing: 1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))),
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
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Proof of identity",
                        style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width * .08,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "In Order to Complete your kyc \nPlease upload a clear copy of your identity. ",
                        style: GoogleFonts.poppins(color: Colors.grey),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "AADHAR CARD",
                            style: GoogleFonts.poppins(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [5, 5],
                              color:
                                  ThemeColors.primaryBlueColor.withOpacity(0.2),
                              strokeWidth: 1,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Consumer<LoginSignUpProvider>(
                                        builder:
                                            (context, userDataProvider, child) {
                                      return Material(
                                        color: aadharImage != null
                                            ? Colors.green.shade50
                                            : Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          splashColor: Colors.blue.shade100,
                                          highlightColor: Colors.transparent,
                                          onTap: aadharImage != null
                                              ? null
                                              : () async {
                                                  final pickedFile =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          imageQuality: 80);
                                                  if (pickedFile != null) {
                                                    aadharImage =
                                                        File(pickedFile.path);
                                                    userDataProvider
                                                        .notifyListeners();
                                                    // await userProvider
                                                    //     .uploadProfileImage(image);
                                                  } else {
                                                    Helper.showScaffold(context,
                                                        "No Image Picked");
                                                  }
                                                },
                                          child: Container(
                                            height: 120,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Upload Aadhar here",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                letterSpacing:
                                                                    1),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Please make sure that every detail of the ID document is clearly visible.',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                                Image.asset(
                                                    "assets/images/kycscreen/kyc.png")
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Consumer<LoginSignUpProvider>(
                                        builder:
                                            (context, userDataProvider, child) {
                                      return aadharImage != null
                                          ? Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                                onTap: !userDataProvider
                                                        .uploadingKycDetails
                                                    ? () {
                                                        aadharImage = null;
                                                        userDataProvider
                                                            .notifyListeners();
                                                      }
                                                    : null,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  height: 20,
                                                  width: 20,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.green),
                                                  child: const Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container();
                                    }),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "PAN CARD",
                            style: GoogleFonts.poppins(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [5, 5],
                              color:
                                  ThemeColors.primaryBlueColor.withOpacity(0.2),
                              strokeWidth: 1,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Consumer<LoginSignUpProvider>(
                                        builder:
                                            (context, userDataProvider, child) {
                                      return Material(
                                        color: panImage != null
                                            ? Colors.green.shade50
                                            : Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          splashColor: Colors.blue.shade100,
                                          highlightColor: Colors.transparent,
                                          onTap: panImage != null
                                              ? null
                                              : () async {
                                                  final pickedFile =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          imageQuality: 80);
                                                  if (pickedFile != null) {
                                                    panImage =
                                                        File(pickedFile.path);
                                                    userDataProvider
                                                        .notifyListeners();
                                                    // await userProvider
                                                    //     .uploadProfileImage(image);
                                                  } else {
                                                    Helper.showScaffold(context,
                                                        "No Image Picked");
                                                  }
                                                },
                                          child: Container(
                                            height: 120,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Upload Pan here",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                letterSpacing:
                                                                    1),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Please make sure that every detail of the ID document is clearly visible.',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                                Image.asset(
                                                    "assets/images/kycscreen/kyc.png")
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Consumer<LoginSignUpProvider>(
                                        builder:
                                            (context, userDataProvider, child) {
                                      return panImage != null
                                          ? Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                                onTap: !userDataProvider
                                                        .uploadingKycDetails
                                                    ? () {
                                                        panImage = null;
                                                        userDataProvider
                                                            .notifyListeners();
                                                      }
                                                    : null,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  height: 20,
                                                  width: 20,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.green),
                                                  child: const Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container();
                                    }),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 25,
                          ),
                          Consumer<LoginSignUpProvider>(
                              builder: (context, userDataProvider, child) {
                            return Material(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  (aadharImage != null && panImage != null) &&
                                          !userDataProvider.uploadingKycDetails
                                      ? ThemeColors.primaryBlueColor
                                      : ThemeColors.primaryBlueColor
                                          .withOpacity(.5),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                highlightColor: Colors.transparent,
                                splashColor:
                                    Colors.blue.shade50.withOpacity(.2),
                                onTap: (aadharImage != null &&
                                            panImage != null) &&
                                        !userDataProvider.uploadingKycDetails
                                    ? () async {
                                        userDataProvider.uploadingKycDetails =
                                            true;
                                        userDataProvider.notifyListeners();
                                        //MainFunction
                                        // var result = await userDataProvider.uploadKycDetails(aadharImage, panImage);
                                        // if(result==true){
                                        //   Navigator.pop(context,result);
                                        // }
                                        // else{
                                        //   Helper.showScaffold(context, "Some Error Occur.");
                                        // }
                                      }
                                    : null,
                                child: Container(
                                  width: double.infinity,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: userDataProvider
                                                .uploadingKycDetails !=
                                            false
                                        ? const KSProgressAnimation(
                                            dotsColor: Colors.white)
                                        : Text(
                                            "Verify Now",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w500),
                                          ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

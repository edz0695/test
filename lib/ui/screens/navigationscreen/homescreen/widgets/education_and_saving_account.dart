import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/sambhav_home_screen.dart';
import '../../../../../config/hiveConfig.dart';
import '../../../../../core/animations/slide_animation.dart';
import '../../../../../core/services/hiveDatabase.dart';
import '../../../../../view/base/not_logged_in_screen.dart';
import '../../../../widgets/box_button_widget.dart';
import '../../education/educationform.dart';

class EducationAndSavingAccountRow extends StatelessWidget {
  const EducationAndSavingAccountRow({
    super.key,
    required this.widget,
  });

  final SambhavHomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SlideAnimation(
          fromRight: 2,
          child: BoxButtonWidget(
            pngIconPath: "assets/images/homescreen/rupee.png",
            iconData: Icons.book,
            title: "Education",
            onTap: () async {
              Box box = await HiveDataBase.openBox(boxName: HiveConfig.user);
              final user = await HiveDataBase.getSingleItem(
                  key: HiveConfig.user, box: box);
              if (user == null) {
                Get.to(
                  () => NotLoggedInScreen(
                    callBack: (success) {
                      if (success) {
                        Get.to(() => const EducationFormScreen());
                      }
                    },
                  ),
                );
              } else {
                Get.to(() => const EducationFormScreen());

                // final loginSignUpProvider =
                //     Provider.of<LoginSignUpProvider>(context, listen: false);
                // if (loginSignUpProvider.userModel != null) {
                //   if (loginSignUpProvider.userModel!.academicStatus == "0") {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const EducationFormScreen()));
                //   } else {
                //     widget.navController.sink.add(3);
                //     widget.pageController.animateToPage(3,
                //         duration: const Duration(microseconds: 500),
                //         curve: Curves.easeInOut);
                //   }
                // } else {
                //   Navigator.push(
                //       context,
                //       CupertinoPageRoute(
                //           fullscreenDialog: true,
                //           builder: (context) => const LoginScreen(
                //                 fromInside: true,
                //               )));
                // }
              }
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SavingAccountCarouselSlider(
            onTap: () =>
                printThis(SavingAccountCarouselSlider().index.toString()),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class SavingAccountCarouselSlider extends StatefulWidget {
  SavingAccountCarouselSlider({super.key, this.onTap});

  final void Function()? onTap;

  int currentIndex = 0;

  int get index => currentIndex;

  @override
  State<SavingAccountCarouselSlider> createState() =>
      _SavingAccountCarouselSliderState();
}

class _SavingAccountCarouselSliderState
    extends State<SavingAccountCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 2,
      itemBuilder: (context, index, realIndex) => Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 5,
        ),
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Saving Account',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Open your saving\naccount with our service',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Lottie.asset(
              'assets/lottie/mony_bag.json',
              height: 70,
            ))
          ],
        ),
      ),
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        height: MediaQuery.of(context).size.height * 0.13,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
        reverse: true,
        viewportFraction: 1,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        enlargeCenterPage: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/model/body/notification_body.dart';
import '../../../themes/colors.dart';
import 'components/changeTextButton.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen(
      {super.key, required this.languages, required this.body});
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {},
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SvgPicture.asset(
                              'assets/onboarding/upipayment.svg',
                              height: 300),
                        ),
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                textAlign: TextAlign.center,
                                "Upi Transactions",
                                style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .08,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                textAlign: TextAlign.center,
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                style: GoogleFonts.ubuntu(
                                  // fontSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SvgPicture.asset(
                            'assets/onboarding/billpayment.svg',
                            height: 300,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                "Credit Cards",
                                style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .08,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                textAlign: TextAlign.center,
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                style: GoogleFonts.ubuntu(
                                  // fontSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SvgPicture.asset(
                              'assets/onboarding/onlinepayment.svg',
                              height: 300),
                        ),
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                "Demat Account",
                                style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .08,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                textAlign: TextAlign.center,
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                style: GoogleFonts.ubuntu(
                                  // fontSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    spacing: 8.0,
                    radius: 100,
                    dotWidth: 15.0,
                    expansionFactor: 1.5,
                    dotHeight: 10.0,
                    strokeWidth: 1.5,
                    dotColor: ThemeColors.primaryBlueColor.withOpacity(0.3),
                    activeDotColor: ThemeColors.primaryBlueColor,
                  ),
                ),
                ChangeTextButton(
                  length: 3,
                  pageController: pageController,
                  languages: widget.languages,
                  body: widget.body,
                ),
                // Consumer<OnBoardingProvider>(
                //     builder: (context, onBoardingProvider, child) {
                //   return Material(
                //     color: Colors.transparent,
                //     child: InkWell(
                //       splashColor: ThemeColors.blueColor.withOpacity(0.2),
                //       highlightColor: Colors.transparent,
                //       borderRadius: BorderRadius.circular(7),
                //       onTap: () async {
                //         if (onBoardingProvider.currentIndex == 2) {
                //           final loginSignUpProvider =
                //               Provider.of<LoginSignUpProvider>(context,
                //                   listen: false);
                //           await loginSignUpProvider
                //               .doneOnBoarding()
                //               .then((value) {
                //             Navigator.pushAndRemoveUntil(
                //                 context,
                //                 CupertinoPageRoute(
                //                     builder: (context) => LoginScreen()),
                //                 (route) => false);
                //           });
                //         }
                //         else {
                //           pageController.nextPage(
                //               duration: const Duration(milliseconds: 300),
                //               curve: Curves.easeInOut);
                //         }
                //       },
                //       child: Center(
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 20, vertical: 15),
                //           child: onBoardingProvider.currentIndex == 2
                //               ? Text(
                //                   "DONE",
                //                   style: GoogleFonts.ubuntu(
                //                       fontWeight: FontWeight.bold,
                //                       color: ThemeColors.blueColor),
                //                 )
                //               : Text(
                //                   "NEXT",
                //                   style: GoogleFonts.ubuntu(
                //                       fontWeight: FontWeight.bold,
                //                       color: ThemeColors.blueColor),
                //                 ),
                //         ),
                //       ),
                //     ),
                //   );
                // }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

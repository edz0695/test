import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payapp/view/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';
import '../../../src/src.dart';
import '../../../data/model/body/notification_body.dart';
import '../../../ui/widgets/samb_bnb.dart';
import '../../../view/screens/home/home_screen.dart';
import 'ca_services/ca_home_screen.dart';
import 'earn_section/earn_main_screen.dart';
import 'education/educationform.dart';
import 'homescreen/sambhav_home_screen.dart';
import 'navigation_drawer_widget.dart';
import 'pod_services/widgets/widgets.dart';
import 'profilescreen/profilescreen.dart';

class NavBar extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;
  final bool fromSplash;
  final int pageIndex;

  const NavBar({
    super.key,
    required this.languages,
    required this.body,
    required this.fromSplash,
    required this.pageIndex,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final pageController = PageController(initialPage: 0);
  final StreamController<int> streamController = StreamController<int>();
  late final Stream<int> navStream;

  Future<bool> _onWillPop() async {
    if (!ResponsiveHelper.isDesktop(context) &&
        Get.find<SplashController>().module != null &&
        Get.find<SplashController>().configModel!.module == null) {
      Get.find<SplashController>().setModule(null);
      return false;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/icons/sad.jpg",
                height: 100,
                width: 100,
              ),
              const Text(
                'Exit App',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Are you sure you want to exit?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: const Text("NO")),
                  TextButton(
                      onPressed: () => SystemNavigator.pop(),
                      child: const Text("YES")),
                ],
              )
            ],
          );
        },
      );

      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    navStream = streamController.stream.asBroadcastStream();
    streamController.sink.add(0);
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavigationDrawerWidget(
          languages: widget.languages,
          body: widget.body,
        ),
        appBar: AppBar(
          titleSpacing: 5,
          toolbarHeight: 60,
          title: const Text(
            "Sambhav",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          foregroundColor: Colors.indigo,
          actions: [
            IconButton(
                onPressed: () => Get.to(() => ProfileScreen(
                    languages: widget.languages, body: widget.body)),
                icon: const Icon(Icons.person)),
            GetBuilder<CartController>(builder: (cartController) {
              final items = cartController.cartList;
              return Badge.count(
                alignment: Alignment.topCenter,
                count: items.isNotEmpty ? items.length : 0,
                backgroundColor: Colors.indigo,
                child: IconButton(
                    onPressed: () =>
                        Get.to(() => const CartScreen(fromNav: false)),
                    icon: const Icon(CupertinoIcons.shopping_cart)),
              );
            }),
            InkWell(
              child: GetBuilder<NotificationController>(
                  builder: (notificationController) {
                return Stack(children: [
                  const Icon(Icons.notifications,
                      size: 25, color: Colors.indigo),
                  notificationController.hasNotification
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1, color: Theme.of(context).cardColor),
                            ),
                          ))
                      : const SizedBox(),
                ]);
              }),
              onTap: () => Get.toNamed(RouteHelper.getNotificationRoute()),
            ),
            width(20),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Consumer<LoginSignUpProvider>(
                    builder: (_, loginSignUpProvider, __) {
                      return PageView.builder(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index) {
                          streamController.sink.add(index);
                        },
                        itemCount: 6,
                        itemBuilder: (_, index) {
                          switch (index) {
                            case 0:
                              return SambhavHomeScreen(
                                languages: widget.languages,
                                body: widget.body,
                              );
                            case 1:
                              return const HomeScreen();
                            case 2:
                              return const CaServicesScreen(
                                fromNAVBAR: true,
                              );
                            case 3:
                              return const EarnMainScreen();
                            case 4:
                              return const EducationFormScreen(
                                fromNAVBAR: true,
                              );
                            default:
                              return PODFactoryScreen(
                                fromNAVBAR: true,
                              );
                          }
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SambBNB(
                      size: size,
                      navStream: navStream,
                      page1Tap: () => _navigateToPage(0),
                      page2Tap: () => _navigateToPage(1),
                      page3Tap: () => _navigateToPage(2),
                      page4Tap: () => _navigateToPage(3),
                      page5Tap: () => _navigateToPage(4),
                      page6Tap: () => _navigateToPage(5),
                      languages: widget.languages,
                      body: widget.body,
                      pageIndex: widget.pageIndex,
                      fromSplash: widget.fromSplash,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    streamController.sink.add(index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:payapp/data/model/response/order_model.dart';
// import 'package:payapp/view/base/cart_widget.dart';
// import 'package:payapp/view/base/custom_dialog.dart';
// import 'package:payapp/view/screens/checkout/widget/congratulation_dialogue.dart';
// import 'package:payapp/view/screens/dashboard/widget/address_bottom_sheet.dart';
// import 'package:payapp/view/screens/dashboard/widget/bottom_nav_item_widget.dart';
// import 'package:payapp/view/screens/favourite/favourite_screen.dart';
// import 'package:payapp/view/screens/home/home_screen.dart';
// import 'package:payapp/view/screens/menu/menu_screen_new.dart';
// import 'package:payapp/view/screens/order/order_screen.dart';
// import '../../../src/src.dart';

// class DashboardScreen extends StatefulWidget {
//   final int pageIndex;
//   final bool fromSplash;

//   const DashboardScreen({
//     super.key,
//     required this.pageIndex,
//     this.fromSplash = false,
//   });

//   @override
//   DashboardScreenState createState() => DashboardScreenState();
// }

// class DashboardScreenState extends State<DashboardScreen> {
//   PageController? _pageController;
//   int _pageIndex = 0;
//   late List<Widget> _screens;
//   final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//   bool _canExit = GetPlatform.isWeb ? true : false;
//   late bool _isLogin;
//   bool active = false;

//   @override
//   void initState() {
//     super.initState();

//     _isLogin = Get.find<AuthController>().isLoggedIn();

//     if (_isLogin) {
//       if (Get.find<SplashController>().configModel?.loyaltyPointStatus == 1 &&
//           Get.find<AuthController>().getEarningPint().isNotEmpty &&
//           !ResponsiveHelper.isDesktop(Get.context)) {
//         Future.delayed(const Duration(seconds: 1),
//             () => showAnimatedDialog(context, const CongratulationDialogue()));
//       }
//       suggestAddressBottomSheet();
//       Get.find<StoreController>().getStoreList(1, false);
//     }

//     _pageIndex = widget.pageIndex;
//     _pageController = PageController(initialPage: widget.pageIndex);

//     _screens = [
//       const HomeScreen(),
//       const FavouriteScreen(),
//       const SizedBox(),
//       const OrderScreen(),
//       const MenuScreenNew()
//     ];

//     Future.delayed(const Duration(seconds: 1), () {
//       setState(() {});
//     });
//   }

//   Future<void> suggestAddressBottomSheet() async {
//     active = await Get.find<LocationController>().checkLocationActive();
//     if (widget.fromSplash &&
//         Get.find<LocationController>().showLocationSuggestion &&
//         active) {
//       Future.delayed(const Duration(seconds: 1), () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           backgroundColor: Colors.transparent,
//           builder: (con) => const AddressBottomSheet(),
//         ).then((value) {
//           Get.find<LocationController>().hideSuggestedLocation();
//           setState(() {});
//         });
//       });
//     }
//   }

//   Future<bool> _onWillPop() async {
//     if (_pageIndex != 0) {
//       _setPage(0);
//       return false;
//     } else {
//       if (!ResponsiveHelper.isDesktop(context) &&
//           Get.find<SplashController>().module != null &&
//           Get.find<SplashController>().configModel!.module == null) {
//         Get.find<SplashController>().setModule(null);
//         return false;
//       } else {
//         if (_canExit) {
//           return true;
//         } else {
//           toast(message: 'back_press_again_to_exit'.tr, bgColor: Colors.green);
//           _canExit = true;
//           Timer(const Duration(seconds: 2), () {
//             _canExit = false;
//           });
//           return false;
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: GetBuilder<OrderController>(builder: (orderController) {
//         List<OrderModel> runningOrder =
//             orderController.runningOrderModel?.orders ?? [];
//         List<OrderModel> reversOrder = List.from(runningOrder.reversed);

//         return Scaffold(
//           key: _scaffoldKey,
//           body: PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _pageIndex = index;
//               });
//             },
//             children: _screens,
//           ),
//           floatingActionButton: ResponsiveHelper.isDesktop(context)
//               ? null
//               : (widget.fromSplash &&
//                       Get.find<LocationController>().showLocationSuggestion &&
//                       active)
//                   ? null
//                   : (orderController.showBottomSheet &&
//                           orderController.runningOrderModel?.orders != null &&
//                           orderController.runningOrderModel!.orders!.isNotEmpty)
//                       ? const SizedBox()
//                       : Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Theme.of(context).cardColor, width: 5),
//                             borderRadius: BorderRadius.circular(30),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.black12,
//                                   blurRadius: 5,
//                                   spreadRadius: 1)
//                             ],
//                           ),
//                           child: FloatingActionButton(
//                             elevation: 0,
//                             backgroundColor: Theme.of(context).primaryColor,
//                             shape: const StadiumBorder(),
//                             onPressed: () {
//                               Get.toNamed(RouteHelper.getCartRoute());
//                             },
//                             child: CartWidget(
//                                 color: Theme.of(context).cardColor, size: 30),
//                           ),
//                         ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: ResponsiveHelper.isDesktop(context)
//               ? const SizedBox()
//               : _buildBottomNavigationBar(orderController),
//         );
//       }),
//     );
//   }

//   void _setPage(int pageIndex) {
//     if (_pageController != null && _pageController!.hasClients) {
//       _pageController!.jumpToPage(pageIndex);
//       setState(() {
//         _pageIndex = pageIndex;
//       });
//     }
//   }

//   Widget _buildBottomNavigationBar(OrderController orderController) {
//     final Size size = MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//             offset: const Offset(-5, 5),
//             blurRadius: 5,
//             color: Colors.white.withOpacity(.5))
//       ]),
//       child: BottomAppBar(
//         elevation: 5,
//         notchMargin: 5,
//         shadowColor: Colors.white,
//         color: Colors.lightBlue.shade50,
//         clipBehavior: Clip.antiAlias,
//         shape: const CircularNotchedRectangle(),
//         child: Center(
//           child: SizedBox(
//             width: size.width,
//             height: 80,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   BottomNavItemWidget(
//                     title: 'home'.tr,
//                     selectedIcon: Images.homeSelect,
//                     unSelectedIcon: Images.homeUnselect,
//                     isSelected: _pageIndex == 0,
//                     onTap: () => _setPage(0),
//                   ),
//                   BottomNavItemWidget(
//                     title: 'favourite'.tr,
//                     selectedIcon: Images.favouriteSelect,
//                     unSelectedIcon: Images.favouriteUnselect,
//                     isSelected: _pageIndex == 1,
//                     onTap: () => _setPage(1),
//                   ),
//                   Container(width: size.width * 0.2),
//                   BottomNavItemWidget(
//                     title: 'orders'.tr,
//                     selectedIcon: Images.orderSelect,
//                     unSelectedIcon: Images.orderUnselect,
//                     isSelected: _pageIndex == 3,
//                     onTap: () => _setPage(3),
//                   ),
//                   BottomNavItemWidget(
//                     title: 'menu'.tr,
//                     selectedIcon: Images.menu,
//                     unSelectedIcon: Images.menu,
//                     isSelected: _pageIndex == 4,
//                     onTap: () => _setPage(4),
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

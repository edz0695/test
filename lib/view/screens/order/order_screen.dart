import 'package:payapp/controller/auth_controller.dart';
import 'package:payapp/controller/order_controller.dart';
import 'package:payapp/helper/responsive_helper.dart';
import 'package:payapp/util/dimensions.dart';
import 'package:payapp/util/styles.dart';
import 'package:payapp/view/base/custom_app_bar.dart';
import 'package:payapp/view/base/menu_drawer.dart';
import 'package:payapp/view/base/not_logged_in_screen.dart';
import 'package:payapp/view/screens/order/widget/order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  OrderScreenState createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    initCall();
  }

  void initCall() {
    if (Get.find<AuthController>().isLoggedIn()) {
      Get.find<OrderController>().getRunningOrders(1);
      Get.find<OrderController>().getHistoryOrders(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    return Scaffold(
      backgroundColor: ThemeColors.backgroundLightBlue,
      appBar: CustomAppBar(
          title: 'my_orders'.tr,
          backButton: ResponsiveHelper.isDesktop(context)),
      endDrawer: const MenuDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: _isLoggedIn
          ? GetBuilder<OrderController>(
              builder: (orderController) {
                return Column(children: [
                  Container(
                    color: ResponsiveHelper.isDesktop(context)
                        ? Theme.of(context).primaryColor.withOpacity(0.1)
                        : Colors.transparent,
                    child: Column(children: [
                      ResponsiveHelper.isDesktop(context)
                          ? Center(
                              child: Padding(
                              padding: const EdgeInsets.only(
                                  top: Dimensions.paddingSizeSmall),
                              child: Text('my_orders'.tr, style: robotoMedium),
                            ))
                          : const SizedBox(),
                      Center(
                        child: SizedBox(
                          width: Dimensions.webMaxWidth,
                          child: Align(
                            alignment: ResponsiveHelper.isDesktop(context)
                                ? Alignment.centerLeft
                                : Alignment.center,
                            child: Container(
                              width: ResponsiveHelper.isDesktop(context)
                                  ? 300
                                  : Dimensions.webMaxWidth,
                              color: ResponsiveHelper.isDesktop(context)
                                  ? Colors.transparent
                                  : ThemeColors.backgroundLightBlue,
                              child: TabBar(
                                controller: _tabController,
                                indicatorColor: Theme.of(context).primaryColor,
                                indicatorWeight: 3,
                                labelColor: Theme.of(context).primaryColor,
                                unselectedLabelColor:
                                    Theme.of(context).disabledColor,
                                unselectedLabelStyle: robotoRegular.copyWith(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: Dimensions.fontSizeSmall),
                                labelStyle: robotoBold.copyWith(
                                    fontSize: Dimensions.fontSizeSmall,
                                    color: Theme.of(context).primaryColor),
                                tabs: [
                                  Tab(text: 'running'.tr),
                                  Tab(text: 'history'.tr),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: _tabController,
                    children: const [
                      OrderView(isRunning: true),
                      OrderView(isRunning: false),
                    ],
                  )),
                ]);
              },
            )
          : NotLoggedInScreen(callBack: (value) {
              initCall();
              setState(() {});
            }),
    );
  }
}

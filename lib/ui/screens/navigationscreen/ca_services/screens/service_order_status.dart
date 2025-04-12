import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/ca_widget/orders_status_item.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/order_status_details.dart';
import 'package:payapp/ui/screens/navigationscreen/navigation_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

import '../../../../../config/route_config.dart';
import '../../../../../data/model/body/notification_body.dart';

class ServiceOrderStatusScreen extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  const ServiceOrderStatusScreen(
      {super.key, required this.languages, required this.body});

  @override
  State<ServiceOrderStatusScreen> createState() =>
      _ServiceOrderStatusScreenState();
}

class _ServiceOrderStatusScreenState extends State<ServiceOrderStatusScreen> {
  bool stillLoading = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        stillLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'GST Service Order Status',
        size: 55,
        onArrowClick: () => RouteConfig.navigate2(
          context,
          NavBar(
            fromSplash: false,
            languages: widget.languages,
            body: widget.body,
            pageIndex: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: stillLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: List.generate(
                      5,
                      (index) => OrderStatusItem(onTap: () {
                            RouteConfig.navigateTo(
                                context, const OrderStatusDetails());
                          })),
                ),
        ),
      ),
    );
  }
}

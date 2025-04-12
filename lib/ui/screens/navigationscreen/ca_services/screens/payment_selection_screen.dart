import 'dart:async';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/ca_widget/selection_widget.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/service_order_status.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../config/route_config.dart';
import '../../../../../data/model/body/notification_body.dart';

class PaymentSelectionScreen extends StatefulWidget {
  const PaymentSelectionScreen(
      {super.key, required this.languages, required this.body});

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<PaymentSelectionScreen> createState() => _PaymentSelectionScreenState();
}

class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
  bool isConfirming = false;

  void confirmation() {
    setState(() {
      isConfirming = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isConfirming = false;
      });
      RouteConfig.navigate2(
          context,
          ServiceOrderStatusScreen(
            languages: widget.languages,
            body: widget.body,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Select Payment', size: 55),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Credit Card',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    //color: Colors.black,
                    size: 30,
                  ),
                  label: const Text(
                    'Add Payment Method',
                    style: TextStyle(
                      //color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SelectionWidget(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isConfirming
          ? IgnorePointer(
              ignoring: true,
              child: FloatingActionButton.extended(
                label: const Text(
                  '        Confirming...        ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onPressed: () {},
              ),
            )
          : FloatingActionButton.extended(
              onPressed: () {
                confirmation();
              },
              label: const Text(
                '      Confirm Payment      ',
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

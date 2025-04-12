
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/components/servicesBoxWodget.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/widgets/earn_to_app_into_row.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/widgets/education_and_saving_account.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/widgets/payout_and_credit_card.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/widgets/wallet_demat_row.dart';
import '../../../../data/model/body/notification_body.dart';
import 'components/home_sevices_categories_list.dart';

class SambhavHomeScreen extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  const SambhavHomeScreen(
      {super.key, required this.languages, required this.body});

  @override
  State<SambhavHomeScreen> createState() => _SambhavHomeScreenState();
}

class _SambhavHomeScreenState extends State<SambhavHomeScreen>
    with AutomaticKeepAliveClientMixin<SambhavHomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 100, top: 10, left: 15, right: 15),
        child: Column(
          children: [
            const PayoutAndCreditCardRow(),
            const SizedBox(height: 15),
            EducationAndSavingAccountRow(widget: widget),
            const SizedBox(height: 15),
            WalletAndDematAccountRow(
              body: widget.body,
              languages: widget.languages,
            ),
            const SizedBox(height: 20),
            EarnToAppIntroRow(widget: widget),
            ListView.separated(
                padding: const EdgeInsets.only(top: 35),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return ServicesWidget(
                      servicesCategory: servicesCategory[index]);
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: servicesCategory.length),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

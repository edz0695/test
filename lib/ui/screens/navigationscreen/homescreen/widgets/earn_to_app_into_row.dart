import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/sambhav_home_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/animations/slide_animation.dart';
import '../../../../../provider/setingsProvider.dart';
import '../../../../dialogs/loaderdialog.dart';
import '../../../../widgets/box_button_widget.dart';
import '../../ca_services/ca_home_screen.dart';
import '../../earn_section/earn_main_screen.dart';
import '../accountmanager/accountmanager.dart';

class EarnToAppIntroRow extends StatelessWidget {
  const EarnToAppIntroRow({
    super.key,
    required this.widget,
  });

  final SambhavHomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SlideAnimation(
          fromRight: .4,
          child: BoxButtonWidget(
            pngIconPath: "assets/images/homescreen/rupee.png",
            title: "Earn",
            onTap: () async => Get.to(() => const EarnMainScreen()),
          ),
        ),
        SlideAnimation2(
          fromTop: .4,
          child: BoxButtonWidget(
            pngIconPath: 'assets/images/homescreen/add_fund.png',
            iconData: Icons.support_agent_outlined,
            title: "Account MGR",
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const AccountManagerScreen()));
            },
          ),
        ),
        SlideAnimation2(
          fromBottom: .4,
          child: BoxButtonWidget(
            pngIconPath: 'assets/images/homescreen/add_fund.png',
            title: 'Ca Services',
            iconData: Icons.star,
            onTap: () async => Get.to(() => const CaServicesScreen()),
          ),
        ),
        Consumer<SettingsProvider>(builder: (_, settingsProvider, child) {
          return SlideAnimation2(
            fromTop: .4,
            child: BoxButtonWidget(
              pngIconPath: 'assets/images/homescreen/add_fund.png',
              iconData: Icons.video_call,
              title: 'App Intro',
              onTap: () async {
                String videoLink = await settingsProvider.getIntroVideo();

                if (videoLink != "") {
                  showVideoDialog(context, videoUrl: videoLink);
                }
              },
            ),
          );
        })
      ],
    );
  }
}

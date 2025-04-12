import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/models/servicesCategoryModel.dart';
import 'package:payapp/view/screens/digital_gold/digital_gold.dart';
import '../../../../../themes/colors.dart';
import '../rechargeservices/mobile/mobilerecharge.dart';
import '../sub_screens/comming_soon_screen.dart';
import '../sub_screens/service_operators_screen.dart';

class ServicesWidget extends StatelessWidget {
  final ServiceCategoryModel servicesCategory;
  const ServicesWidget({super.key, required this.servicesCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: ThemeColors.primaryBlueColor.withOpacity(.05),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: Colors.grey.withOpacity(0.5),width: .5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            servicesCategory.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: servicesCategory.services.length,
              itemBuilder: (_, indexSecondary) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: servicesCategory.services[indexSecondary].onTap !=
                            null
                        ? () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const MobileRechargeScreen()));
                          }
                        : (servicesCategory
                                        .services[indexSecondary].serviceType !=
                                    null &&
                                servicesCategory
                                        .services[indexSecondary].serviceName !=
                                    "Digital Gold")
                            ? () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            ServiceOperatorsScreen(
                                              appBarTitle: servicesCategory
                                                  .services[indexSecondary]
                                                  .serviceName,
                                              serviceType: servicesCategory
                                                  .services[indexSecondary]
                                                  .serviceType!,
                                            )));
                              }
                            : servicesCategory
                                        .services[indexSecondary].serviceName !=
                                    "Digital Gold"
                                ? () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                ComingSoonScreen(
                                                  title: servicesCategory
                                                      .services[indexSecondary]
                                                      .serviceName,
                                                )));
                                  }
                                : () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const DigitalGold()));
                                  },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      width: 85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: SvgPicture.asset(
                            servicesCategory.services[indexSecondary].svgIcon,
                            height: 40,
                            width: 40,
                          )),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            servicesCategory
                                .services[indexSecondary].serviceName,
                            style: GoogleFonts.poppins(
                                fontSize:
                                    MediaQuery.of(context).size.width * .030),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

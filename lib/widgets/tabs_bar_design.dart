import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/components/tab_indicator.dart';
import '../themes/colors.dart';

class CustomTabsBar extends StatelessWidget {
  const CustomTabsBar({super.key, required this.tabs, this.isScrollable});

  final List<Widget> tabs;
  final bool? isScrollable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            color: const Color(0xff2057A6).withOpacity(0.2),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: TabBar(
        tabs: tabs,
        isScrollable: isScrollable??false,
        labelStyle: GoogleFonts.poppins(),
        labelColor: ThemeColors.primaryBlueColor,
        splashBorderRadius: BorderRadius.circular(10),
        indicator: const CvTabIndicator(
          indicatorHeight: 4,
          indicatorColor: ThemeColors.primaryBlueColor,
          indicatorSize: CvTabIndicatorSize.normal,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }
}

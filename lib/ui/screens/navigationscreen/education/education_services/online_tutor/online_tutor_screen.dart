import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/shared_widgets/educate_yourself_banner.dart';
import 'package:payapp/ui/screens/navigationscreen/education/shared_widgets/find_service_search_bar.dart';
import 'package:payapp/ui/screens/navigationscreen/education/shared_widgets/hello_user_account_row.dart';
import 'package:payapp/ui/screens/navigationscreen/education/shared_widgets/tutors_and_coaching_bar.dart';

import '../../../../../widgets/app_bar_widget.dart';
import '../../shared_widgets/tutors_carousel_banner.dart';
import '../../shared_widgets/tutors_categories_builder.dart';

class TutorOnlineScreen extends StatelessWidget {
  const TutorOnlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const AppBarWidget(title: 'Online Tutor', size: 55),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EducateYourselfBanner(),
            const FindServiceSearchBar(),
            TutorsCarouselBanners(imgList: imgList),
            const TutorsCategoriesBuilder(),
          ],
        ),
      ),
    );
  }
}



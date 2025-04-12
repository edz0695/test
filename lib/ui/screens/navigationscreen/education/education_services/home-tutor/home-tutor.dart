import 'package:flutter/material.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../shared_widgets/find_service_search_bar.dart';
import '../../shared_widgets/tutors_carousel_banner.dart';
import '../../shared_widgets/tutors_categories_builder.dart';

class HomeTutor extends StatelessWidget {
  const HomeTutor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Home Tutor', size: 30),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const EducateYourselfBanner(),
            const FindServiceSearchBar(),
            height(20),
            TutorsCarouselBanners(imgList: imgList),
            height(10),
            const TutorsCategoriesBuilder(),
          ],
        ),
      ),
    );
  }
}

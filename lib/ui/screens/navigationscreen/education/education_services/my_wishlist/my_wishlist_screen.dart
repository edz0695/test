import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/my_wishlist/tabs/course_wishlist_tab.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/my_wishlist/tabs/teacher_wishlist_tab.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/widgets/tabs_bar_design.dart';



class MyWishlistScreen extends StatefulWidget {
  const MyWishlistScreen({super.key});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: "My Wishlist",
        size: 55,
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Expanded(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomTabsBar(
                    tabs: [
                      Tab(
                        text: "Teachers",
                      ),
                      Tab(
                        text: "Courses",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [TeacherWishlistTab(), CourseWishlistTab()],
                    ),
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}

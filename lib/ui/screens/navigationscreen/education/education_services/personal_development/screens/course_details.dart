import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/personal_development/tabs/modules_tab.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/personal_development/tabs/reviews_tab.dart';
import 'package:payapp/widgets/tabs_bar_design.dart';

class CourseDetailsScreen extends StatelessWidget {
  final String logo;
  final String title;
  final String shortDescription;
  final String description;
  final List banner;
  final List reviews;
  final String price;
  final String id;
  final String categoryId;

  const CourseDetailsScreen(
      {super.key,
      required this.logo,
      required this.shortDescription,
      required this.description,
      required this.banner,
      required this.reviews,
      required this.price,
      required this.id,
      required this.categoryId,
      required this.title});

  @override
  Widget build(BuildContext context) {
    print("This is the course ID : $id");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: banner.length,
                            options: CarouselOptions(
                              height: 340.0,
                              reverse: true,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                            ),
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return Image.network(
                                banner[index],
                                width: MediaQuery.of(context).size.width,
                                height: 340,
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 40, left: 10, right: 10, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor:
                                          ThemeColors.darkBlueColor,
                                      child: CircleAvatar(
                                        radius: 23,
                                        backgroundImage: NetworkImage(logo),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Welcome!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  title,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  shortDescription,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.timelapse_rounded,
                                        color: ThemeColors.darkBlueColor,
                                        size: 14,
                                      ),
                                      label: const Text(
                                        '2h 54m',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.timelapse_rounded,
                                        color: ThemeColors.darkBlueColor,
                                        size: 14,
                                      ),
                                      label: const Text(
                                        '25 Lessons',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.timelapse_rounded,
                                        color: ThemeColors.darkBlueColor,
                                        size: 14,
                                      ),
                                      label: const Text(
                                        '2h 54m',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: MediaQuery.of(context).size.height /
                          MediaQuery.of(context).size.height *
                          1.26,
                      child: Container(
                        height: MediaQuery.of(context).size.height + 320,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              CustomTabsBar(
                                tabs: [
                                  Tab(
                                    text: "Modules",
                                  ),
                                  Tab(
                                    text: "Description",
                                  ),
                                  Tab(
                                    text: "Reviews",
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    ModulesTab(
                                      courseId: id,
                                    ),
                                    Text(description),
                                    ReviewsTab(
                                      reviews: reviews,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(color: Colors.white, height: 40),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        extendedPadding: const EdgeInsets.symmetric(horizontal: 80),
        label: Text(
          'Enroll Now {₹$price}',
        ),
      ),
    );
  }
}

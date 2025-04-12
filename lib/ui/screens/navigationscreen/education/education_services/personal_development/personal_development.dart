import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/personal_development/screens/course_details.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../provider/earn_providers/earn_screen_provider.dart';

class PersonalDevelopment extends StatefulWidget {
  const PersonalDevelopment({super.key});

  @override
  State<PersonalDevelopment> createState() => _PersonalDevelopmentState();
}

class _PersonalDevelopmentState extends State<PersonalDevelopment> {
  List allCourses = [];
  bool coursesLoading = true;
  bool coursesError = false;

  Future<void> fetchCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('token');
    final url = 'https://xyzabc.sambhavapps.com/v1/education/pd/course';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $jwtToken',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body)["data"];
        coursesLoading = false;
        allCourses.clear(); // Clear existing chapters before adding new ones
        print(data);
        data.forEach((e) {
          allCourses = [...allCourses, e];
        });
      });
    } else {
      setState(() {
        coursesError = true;
        coursesLoading = false;
      });
      throw Exception('Failed to load chapters');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const AppBarWidget(title: 'Personal Development', size: 55),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 23.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Alonzo Lee",
                              style: TextStyle(
                                color: ThemeColors.darkBlueColor,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.back_hand_rounded,
                              color: Colors.green,
                              size: 28,
                            )
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.brown,
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w300,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                    filled: true,
                    fillColor: Colors.deepOrangeAccent.withOpacity(0.1),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            color: ThemeColors.darkBlueColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CoursesCategory(allCourses),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            const Text(
                              'All courses',
                              style: TextStyle(
                                color: ThemeColors.darkBlueColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return AllCoursesList(courses: allCourses);
                                  },
                                ));
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: const Text(
                                'See All >',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        // padding: const EdgeInsets.symmetric(
                        //     horizontal: 5, vertical: 10),
                        children: [
                          ...allCourses.map((e) {
                            print("Course");
                            print(e);
                            return buildCourseCard(context,
                                categoryId: "654dd81d5c4309cea8bebcce",
                                title: e["title"],
                                price: e["price"],
                                shortDescription: e["short_des"],
                                description: "long des",
                                banner: e["banner"],
                                logo: e["logo"],
                                reviews: e["review"],
                                id: e["id"]);
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

Widget buildCourseCard(BuildContext context,
    {required String id,
    required String title,
    required String shortDescription,
    required String categoryId,
    required String description,
    required String price,
    required String logo,
    required List reviews,
    required List banner}) {
  var totalRating = 0;

  for (var element in reviews) {
    totalRating = totalRating + element["star"] as int;
  }
  var reviewsCount = reviews.length;
  var overallRating = totalRating / reviewsCount;
  if (reviewsCount == 0) {
    overallRating = 0;
  }
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CourseDetailsScreen(
          banner: banner,
          logo: logo,
          shortDescription: shortDescription,
          description: description,
          reviews: reviews,
          price: price,
          id: id,
          categoryId: categoryId,
          title: title,
        ),
      ));
    },
    child: Container(
      // height: 350,
      width: 250,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(logo), fit: BoxFit.fill)),
      child: Stack(
        children: [
          Positioned(
            bottom: 80,
            child: Container(
              // width: MediaQuery.of(context).size.width * .4,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              // height: 40,
              width: MediaQuery.of(context).size.width * .4,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                shortDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Container(
              // height: 40,
              width: MediaQuery.of(context).size.width * .4,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                shortDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class CousesCarousel extends StatelessWidget {
  final String logo;

  const CousesCarousel({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(logo),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}

Container buildContainer(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 96,
          width: MediaQuery.of(context).size.width * .5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: NetworkImage(
                'https://th.bing.com/th/id/OIP.M0FZeVMZa_n7zHGbAcJF1wHaFj?pid=ImgDet&rs=1',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * .4,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Explore the intersection of all and medicine ' * 5,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18.0,
                        color: Colors.amberAccent,
                      ),
                      Text(
                        '4.5 (453)',
                        style: TextStyle(
                          color: ThemeColors.darkBlueColor,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  child: const Text(
                    '\$150.00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: ThemeColors.backgroundLightBlue,
        ),
        child: Consumer<EarnScreenProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: ThemeColors.backgroundLightBlue,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.updateIndex(index);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: ThemeColors.backgroundLightBlue,
                  icon: Icon(Icons.cast_for_education),
                  label: 'Courses',
                ),
                BottomNavigationBarItem(
                  backgroundColor: ThemeColors.backgroundLightBlue,
                  icon: Icon(
                    Icons.star,
                  ),
                  label: 'Certificates',
                ),
                BottomNavigationBarItem(
                  backgroundColor: ThemeColors.backgroundLightBlue,
                  icon: Icon(
                    Icons.add_chart,
                  ),
                  label: 'Progress',
                ),
                BottomNavigationBarItem(
                  backgroundColor: ThemeColors.backgroundLightBlue,
                  icon: Icon(
                    Icons.question_answer_outlined,
                  ),
                  label: 'Q/A',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CoursesCategory extends StatelessWidget {
  final List courses;

  const CoursesCategory(this.courses, {super.key});

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    final String? token = await _getToken();
    if (token == null) {
      throw Exception('JWT token not found in shared preferences');
    }

    final url =
        Uri.parse('https://xyzabc.sambhavapps.com/v1/education/pd/category');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["data"];
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      backgroundColor: WidgetStateProperty.all(ThemeColors.darkBlueColor),
      padding:
          WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
      side: WidgetStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.grey, width: 1),
      ),
    );
    return Consumer(
      builder: (context, provider, child) =>
          FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final categories = snapshot.data ?? [];
            return SingleChildScrollView(
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            var filteredCourses = [];
                            print("You have pressed : $index");
                            print(categories[index]);
                            for (var element in courses) {
                              if (element["cat_id"] ==
                                  categories[index]["id"]) {
                                filteredCourses = [...filteredCourses, element];
                              }
                            }
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return CourseByCategoryList(
                                  filteredCourses: filteredCourses,
                                  category: categories[index]["name"],
                                );
                              },
                            ));
                          },
                          style: style,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  categories[index]["logo"],
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                categories[index]["name"],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class CourseByCategoryList extends StatelessWidget {
  const CourseByCategoryList({
    super.key,
    required this.filteredCourses,
    required this.category,
  });

  final List filteredCourses;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        size: 55,
        title: category,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in each row
            childAspectRatio: (MediaQuery.of(context).size.width * 0.5 / 280),
            // crossAxisSpacing: 8.0, // Spacing between columns
            // mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemCount: filteredCourses.length,
          itemBuilder: (context, index) {
            return buildCourseCard(
              context,
              categoryId: filteredCourses[index]["cat_id"],
              title: filteredCourses[index]["title"],
              price: filteredCourses[index]["price"],
              shortDescription: filteredCourses[index]["short_des"],
              description: "long des",
              banner: filteredCourses[index]["banner"],
              logo: filteredCourses[index]["logo"],
              reviews: filteredCourses[index]["review"],
              id: filteredCourses[index]["id"],
            );
          },
        ),
      ),
    );
  }
}

class AllCoursesList extends StatelessWidget {
  const AllCoursesList({
    super.key,
    required this.courses,
  });

  final List courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        size: 55,
        title: "All Courses",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in each row
            childAspectRatio: (MediaQuery.of(context).size.width * 0.5 / 280),
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return buildCourseCard(
              context,
              categoryId: courses[index]["cat_id"],
              title: courses[index]["title"],
              price: courses[index]["price"],
              shortDescription: courses[index]["short_des"],
              description: "long des",
              banner: courses[index]["banner"],
              logo: courses[index]["logo"],
              reviews: courses[index]["review"],
              id: courses[index]["id"],
            );
          },
        ),
      ),
    );
  }
}

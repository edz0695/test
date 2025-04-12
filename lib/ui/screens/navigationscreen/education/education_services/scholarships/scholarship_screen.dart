import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/scholarships/screens/gov_results_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../../../core/animations/shimmer_animation.dart';
import '../../../../../../core/components/tab_indicator.dart';
import '../../../../../../src/src.dart';
import 'package:http/http.dart' as http;

import 'screens/samb_sch_res_screen.dart';
import 'widgets/scholarship_list_widget.dart';

class ScholarshipScreen extends StatefulWidget {
  const ScholarshipScreen({super.key});

  @override
  State<ScholarshipScreen> createState() => _ScholarshipScreenState();
}

class _ScholarshipScreenState extends State<ScholarshipScreen> {
  @override
  void initState() {
    super.initState();
    final scholarshipProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    scholarshipProvider.getScholarships();
    scholarshipProvider.isLoadingCategorised = true;
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Scholarships',
        size: 55,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imgList[itemIndex],
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const ShimmerAnimation();
                        },
                        loadingBuilder: (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                        ) {
                          if (loadingProgress == null) return child;
                          return const ShimmerAnimation();
                        },
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 1.39),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10),
              children: [
                BoxButtonScholarship(
                  pngIconPath: "assets/education/jee-main.png",
                  title: "Sambhav\nScholarships",
                  onTap: () => Get.to(() => SambhavScholarshipsListWidget()),
                ),
                BoxButtonScholarship(
                  pngIconPath: "assets/education/jee-advance.png",
                  title: "Sambhav\nScholarships Results",
                  onTap: () => Get.to(() => SambhavScholarshipsResultsScreen()),
                ),
                BoxButtonScholarship(
                  pngIconPath: "assets/education/wbjee.png",
                  title: "GOV Scholarships",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const GOVScholarshipsList();
                      },
                    ));
                  },
                ),
                BoxButtonScholarship(
                  pngIconPath: "assets/education/wbjee.png",
                  title: "Government Scholarships Results",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GOVResultsScreen(
                                  title: 'Government Results',
                                )));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoxButtonScholarship extends StatelessWidget {
  final String title;
  final String pngIconPath;
  final Function()? onTap;
  final IconData? iconData;
  final bool withShadow;

  const BoxButtonScholarship({
    super.key,
    required this.title,
    required this.pngIconPath,
    this.onTap,
    this.iconData,
    this.withShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: withShadow
                ? [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: ThemeColors.primaryBlueColor.withOpacity(0.65),
                        blurRadius: 10.0,
                        spreadRadius: 3),
                  ]
                : [],
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.black.withOpacity(.08),
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: iconData != null
                  ? Center(
                      child: Icon(
                        iconData,
                        color: ThemeColors.blueColor1,
                        size: 65,
                      ),
                    )
                  : Image.asset(
                      pngIconPath,
                      color: const Color(0xff2057A6),
                      height: 70,
                      width: 70,
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12.5,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

class GOVScholarshipsList extends StatefulWidget {
  const GOVScholarshipsList({super.key});

  @override
  State<GOVScholarshipsList> createState() => _GOVScholarshipsListState();
}

class _GOVScholarshipsListState extends State<GOVScholarshipsList> {
  var scholarships;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchScholarships();
  }

  Future<void> _fetchScholarships() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var apiUrl =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/scholarship');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        setState(() {
          scholarships = decodedResponse["data"];
          isLoading = false;
        });
      } else {
        printThis(
            'API Request Failed with Status Code: ${response.statusCode}');
        if (context.mounted) {
          setState(() {
            isLoading = false;
            errorMessage = 'Failed to fetch scholarships.';
          });
        }
      }
    } catch (error) {
      if (context.mounted) {
        setState(() {
          isLoading = false;
          errorMessage = 'Error calling API.';
        });
      }
    }
  }

  Widget buildShimmerBox() {
    return Shimmer(
      duration: const Duration(seconds: 3),
      // Adjust duration as needed
      interval: const Duration(milliseconds: 500),
      // Adjust interval as needed
      enabled: isLoading,
      direction: const ShimmerDirection.fromLTRB(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Container(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 200,
                        height: 15,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ThemeColors.darkBlueColor,
                ),
              ),
              elevation: 5,
              centerTitle: false,
              title: const Text(
                "Scholarships",
                style: TextStyle(
                  color: ThemeColors.darkBlueColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              collapsedHeight: 250,
              stretch: true,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imgList[itemIndex],
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const ShimmerAnimation();
                        },
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 170,
                    viewportFraction: 0.95,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ), // Placeholder widget if offer is null
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Container(
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
                    tabs: const [
                      Tab(
                        child: Text(
                          'Programs',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Results',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    isScrollable: false,
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
                ),
              ),
            ),
          ],
          body: isLoading
              ? ListView.builder(
                  itemCount: 5, // Number of shimmer boxes
                  itemBuilder: (context, index) {
                    return buildShimmerBox();
                  },
                )
              : TabBarView(
                  children: [
                    scholarships != null && scholarships.length > 0
                        ? Padding(
                            // margin: EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                              itemCount: scholarships.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: 150,
                                            child: Image.network(
                                                scholarships[index]["logo"])),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Text(
                                                      scholarships[index]
                                                          ["title"],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  // Text(
                                                  //   "this is scholarship description",
                                                  //   style: TextStyle(
                                                  //       fontSize: 15,
                                                  //       fontWeight:
                                                  //           FontWeight.w400),
                                                  // )
                                                ],
                                              ),
                                              FilledButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStateProperty.all<
                                                              Color>(
                                                          ThemeColors
                                                              .blueColor1),
                                                  // Set background color to blue
                                                  shape: WidgetStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0), // Adjust as desired
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) {
                                                      return ScholarshipDetailsScreen(
                                                        title:
                                                            scholarships[index]
                                                                ["title"],
                                                        id: scholarships[index]
                                                            ["id"],
                                                        logo:
                                                            scholarships[index]
                                                                ["logo"],
                                                        banner:
                                                            scholarships[index]
                                                                ["banner"],
                                                        details:
                                                            scholarships[index]
                                                                ["details"],
                                                      );
                                                    },
                                                  ));
                                                },
                                                child: const Text("Enroll Now"),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          )
                        : const Center(
                            // Display message when no scholarships available
                            child: Text('No scholarships available.'),
                          ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(3, 3),
                              color: const Color(0xff2057A6).withOpacity(0.2),
                              blurRadius: 20.0,
                            ),
                          ],
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.3), width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: const HtmlWidget(
                        "Results",
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class ScholarshipDetailsScreen extends StatefulWidget {
  final String title;
  final String id;
  final String logo;
  final List banner;
  final String details;

  const ScholarshipDetailsScreen(
      {super.key,
      required this.title,
      required this.id,
      required this.logo,
      required this.banner,
      required this.details});

  @override
  State<ScholarshipDetailsScreen> createState() =>
      _ScholarshipDetailsScreenState();
}

class _ScholarshipDetailsScreenState extends State<ScholarshipDetailsScreen> {
  var scholarships;
  bool isLoading = true; //

  @override
  void initState() {
    super.initState();
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            leading: back(),
            elevation: 5,
            centerTitle: false,
            title: Text(
              widget.title,
              style: const TextStyle(
                color: ThemeColors.darkBlueColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            collapsedHeight: 250,
            stretch: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                    // color: Colors.white70,
                    ),
                child: CarouselSlider.builder(
                  itemCount: widget.banner.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    decoration: BoxDecoration(
                      // color: Colors.white70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.banner[itemIndex],
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const ShimmerAnimation();
                        },
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 170,
                    viewportFraction: 0.95,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
          )
        ],
        body: Column(
          children: [
            Expanded(
              child: Padding(
                // margin: EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [HtmlWidget(widget.details)],
                      )),
                  // Container(
                  //     margin: EdgeInsets.only(bottom: 10),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     padding: EdgeInsets.all(10),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "Eligibility : ",
                  //           style: TextStyle(
                  //               fontSize: 18, fontWeight: FontWeight.w600),
                  //         ),
                  //         SizedBox(
                  //           height: 3,
                  //         ),
                  //         Text(
                  //           "\u2022 this is scholarship eligibility",
                  //           style: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.w400),
                  //         ),
                  //         SizedBox(
                  //           height: 3,
                  //         ),
                  //         Text(
                  //           "\u2022 this is scholarship eligibility",
                  //           style: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.w400),
                  //         ),
                  //         SizedBox(
                  //           height: 3,
                  //         ),
                  //         Text(
                  //           "\u2022 this is scholarship eligibility",
                  //           style: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.w400),
                  //         ),
                  //       ],
                  //     )),
                  // Container(
                  //     margin: EdgeInsets.only(bottom: 10),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     padding: EdgeInsets.all(10),
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           "Result on : ",
                  //           style: TextStyle(
                  //               fontSize: 18, fontWeight: FontWeight.w600),
                  //         ),
                  //         SizedBox(
                  //           height: 3,
                  //         ),
                  //         Text(
                  //           "2023-02-20",
                  //           style: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.w400),
                  //         )
                  //       ],
                  //     )),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            ThemeColors.blueColor1),
                        // Set background color to blue
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust as desired
                          ),
                        ),
                        // Set width and leave height flexible
                      ),
                      onPressed: () {},
                      child: const Text("View Result"),
                    ),
                  ),
                ]),
              ),
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(ThemeColors.blueColor1),
                // Set background color to blue
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust as desired
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text("Enroll Now"),
            ),
          ],
        ),
      ),
    );
  }
}

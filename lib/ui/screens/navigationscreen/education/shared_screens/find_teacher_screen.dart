import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../src/src.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../shared_widgets/build_teacher_card.dart';
import 'package:location/location.dart' as loc;

class FindTeacherScreen extends StatefulWidget {
  const FindTeacherScreen({super.key});

  @override
  State<FindTeacherScreen> createState() => _FindTeacherScreenState();
}

class _FindTeacherScreenState extends State<FindTeacherScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<EducationController>().filterTeacherAPI({
      "longitude": "80.949997",
      "latitude": "26.850000",
      "distance": "348934.78"
    });
    Get.find<EducationController>().fetchTeachersProfile();
  }

  // Future<void> _getLocation() async {
  //   try {
  //     var currentLocation = await _location.getLocation();

  //     setState(() {
  //       _latitude = currentLocation.latitude.toString();
  //       _longitude = currentLocation.longitude.toString();
  //     });
  //     printThis("Latitude ..............$_latitude");
  //   } catch (e) {
  //     printThis(e);
  //   }
  // }

  final controller = Get.find<EducationController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(title: 'Find Home Teacher', size: 55),
      body: Obx(() {
        final filteredTeachers =
            Get.find<EducationController>().filteredTeachers.value?.data ?? [];
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Center(
                    child: TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        hintText: 'Fetch from current location',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.location_on,
                            ),
                            onPressed: () async {
                              controller.getCurrentLocation(false);
                              // setState(() {});
                            },
                            color: Colors.indigo,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Lottie.asset(
                            'assets/lottie/search_icon.json',
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                height(10),
                const HorizontalItemList(),
                filteredTeachers.isNotEmpty
                    ? controller.loading.value
                        ? Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: loading(),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 5,
                              childAspectRatio: 1 / 2,
                            ),
                            itemCount: filteredTeachers.length,
                            itemBuilder: (_, index) {
                              final teacher = filteredTeachers[index];

                              return BuildTeacherCard(
                                size: size,
                                title: teacher.name,
                                subTitle: teacher.image,
                                image: teacher.image,
                                rating: teacher.ratings
                                    .map((i) => i.star)
                                    .join(", ")
                                    .toString(),
                                teacherId: teacher.id,
                              );
                            },
                          )
                    : controller.isLoading.value
                        ? Padding(
                            padding: EdgeInsets.only(top: 300),
                            child: loading(),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 5,
                              childAspectRatio: 1 / 2,
                            ),
                            itemCount: controller.teachersProfile.length,
                            itemBuilder: (_, index) {
                              final teacher = controller.teachersProfile[index];
                              return BuildTeacherCard(
                                size: size,
                                title: teacher["name"],
                                subTitle: teacher["image"],
                                image: teacher["image"],
                                rating: teacher["rating"].toString(),
                                teacherId: teacher["id"].toString(),
                              );
                            },
                          ),
              ],
            ),
          ),
        );
      }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        width: MediaQuery.of(context).size.width * 65,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: Colors.black.withValues(alpha: .85),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list_rounded,
                size: 25,
                color: Colors.white,
              ),
              label: Text(
                'Filter',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ),
            Container(width: .8, height: 30, color: Colors.grey),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.sort_rounded,
                size: 25,
                color: Colors.white,
              ),
              label: Text(
                'Sorting',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<List<String>> filters = [
  [
    'Distances',
    'Near 1Km',
    'Near 2Km',
    'Near 3Km',
    'Near 4Km',
    'Near 5Km',
  ],
  [
    'Subjects',
    'Maths',
    'Physics',
    'English',
    'Hindi',
    'Arabic',
  ],
  [
    'Fee(in Rupee)',
    '100/m',
    '200/m',
    '200/m',
    '200/m',
    '200/m',
  ],
];
List<String> distances = [
  'Distances',
  'Near 1Km',
  'Near 2Km',
  'Near 3Km',
  'Near 4Km',
  'Near 5Km',
];
List<String> subjects = [
  'Subjects',
  'Maths',
  'Physics',
  'English',
  'Hindi',
  'Arabic',
];
List<String> fees = [
  'Fee(in Rupee)',
  '100/m',
  '200/m',
  '200/m',
  '200/m',
  '200/m',
];

class HorizontalItemList extends StatelessWidget {
  const HorizontalItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: filters.length,
        itemBuilder: (context, index) => DropdownButtonExample(
          menu: filters[index],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key, required this.menu});

  final List<String> menu;

  @override
  _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late String selectedFilter;

  final controller = Get.find<EducationController>();

  final loc.Location _location = loc.Location();

  void _showMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset offset = overlay.localToGlobal(const Offset(110, 220));
    showMenu(
      context: context,
      position:
          RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
      items: widget.menu
          .map(
            (
              filter,
            ) =>
                PopupMenuItem(
              child: Text(filter),
              onTap: () async {
                final loc = await _location.getLocation();
                RegExp regExp = RegExp(r'\d+');

                Match? match = regExp.firstMatch(filter);

                Map<String, String> json = {
                  "longitude": loc.latitude.toString(),
                  "latitude": loc.longitude.toString(),
                  "distance": (int.parse(match!.group(0)!) * 1000).toString()
                };

                controller.filterTeacherAPI(json);
                setState(() => selectedFilter = filter);
              },
            ),
          )
          .toList(),
    );
  }

  @override
  void initState() {
    selectedFilter = widget.menu.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _showMenu(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: Colors.white,
            border: Border.all(color: Colors.grey[400]!, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff2A63B8).withValues(alpha: .3),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: ThemeColors.darkBlueColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                selectedFilter,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/config/route_config.dart';
import 'package:payapp/controller/controllers.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import 'package:payapp/models/education_model/notes_models/subjectmodel.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/notes/screens/select_chapter_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

class SelectSubjectScreen extends StatelessWidget {
  const SelectSubjectScreen(
      {super.key, required this.classNumber, required this.classId});

  final String classNumber;

  final String classId;

  @override
  Widget build(BuildContext context) {
    final EducationController controller = Get.find<EducationController>();
    controller.fetchSubjects(classId);
    return Obx(() {
      final List<Subject> subjects = controller.filteredSubjects.isEmpty
          ? controller.subjects.value?.data ?? []
          : controller.filteredSubjects;
      return Scaffold(
        backgroundColor: ThemeColors.backgroundLightBlue,
        appBar: AppBarWidget(title: classNumber, size: 55),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: controller.isLoadingSubjects.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBar(
                      elevation: WidgetStateProperty.all(1),
                      hintText: 'Search for a specific subject',
                      hintStyle: WidgetStateProperty.all(
                        const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (text) async =>
                          await controller.filterSubject(text),
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Lottie.asset(
                          'assets/lottie/search_icon.json',
                          height: 30,
                        ),
                      ),
                    ),
                    height(20),
                    if (controller.subjects.value != null)
                      const Text(
                        'Select Subject',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ThemeColors.darkBlueColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(height: 10),
                    controller.subjects.value == null
                        ? Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Lottie.asset(
                                      'assets/lottie/not_found.json'),
                                ),
                                const Text(
                                  'No subjects Found!',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ThemeColors.darkBlueColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : GridView.builder(
                            itemBuilder: (context, index) {
                              final subject = subjects[index];
                              return buildSubjectContainer(
                                subject: subject,
                                onTap: () => RouteConfig.navigateToRTL(
                                  context,
                                  SelectChapterScreen(
                                    classNumber: classNumber,
                                    subject: subject.name,
                                    subjectId: subject.id,
                                  ),
                                ),
                              );
                            },
                            itemCount: subjects.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 1),
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                          ),
                  ],
                ),
        ),
      );
    });
  }

  InkWell buildSubjectContainer(
      {required VoidCallback onTap, required Subject subject}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: ThemeColors.lightBlueCard,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              child: Image.network(
                subject.logo,
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              subject.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: ThemeColors.darkBlueColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

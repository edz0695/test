import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../../../src/src.dart';
import '../../../../../../widgets/row_text_widget.dart';

class HomeWorkDetails extends StatelessWidget {
  const HomeWorkDetails({super.key, required this.id, required this.teacherId});
  final String id, teacherId;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final EducationController controller = Get.find<EducationController>();
    return Scaffold(
      appBar: const AppBarWidget(title: "Home Work", size: 30),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
            future: controller.fetchHomeworkDetails(id),
            builder: (context, snapshot) {
              controller.fetchTeacherProfileById(teacherId);
              return Obx(() {
                final homeworks = controller.homeworkDetails.value?.data;
                final profile = controller.teacherProfileDetails;
                return controller.isHomeworkLoading.value
                    ? Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: loading(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(profile[
                                            "image"] ??
                                        "https://static.vecteezy.com/system/resources/previews/028/569/170/original/single-man-icon-people-icon-user-profile-symbol-person-symbol-businessman-stock-vector.jpg"),
                                  ),
                                ),
                                width(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RowTextWidget(
                                      title: "Assigned by",
                                      desc: profile["name"] ?? '',
                                    ),
                                    RowTextWidget(
                                      title: "Bio",
                                      desc: profile["bio"] ?? '',
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            RowTextWidget(
                              title: "Assigned Date",
                              desc: DateFormat.yMMMMd()
                                  .format(homeworks!.assignedDate),
                            ),
                            RowTextWidget(
                              title: "Submit Date",
                              desc: DateFormat.yMMMMd()
                                  .format(homeworks.lastSubmissionDate),
                            ),
                            RowTextWidget(
                              title: "Topic",
                              desc: homeworks.title,
                            ),
                            RowTextWidget(
                                title: "Text Home Work",
                                desc: homeworks.textHomework.toString()),
                            Divider(
                              color: Colors.grey,
                            ),
                            height(20),
                            Expanded(
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: homeworks.questions.length,
                                itemBuilder: (context, index) {
                                  final homeWork = homeworks.questions[index];
                                  return buildSingleHomeWork(
                                      index: index,
                                      size: size,
                                      homework: homeWork);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
              });
            }),
      ),
    );
  }

  Widget buildSingleHomeWork(
      {required Size size,
      required HomeworkDetailsQuestion homework,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Q${index + 1}: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: ThemeColors.darkBlueColor,
                ),
              ),
              Flexible(
                child: Text(
                  homework.question,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ThemeColors.darkBlueColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: ThemeColors.darkBlueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {},
                child: const Text(
                  "Submit Now",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          height(20),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: ThemeColors.backgroundLightBlue,
              child: Container(
                width: Get.size.width,
                height: Get.size.height * .5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                      homework.file,
                    ))),
              )),
        ],
      ),
    );
  }
}

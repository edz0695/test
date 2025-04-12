import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/notes/notes_main_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../../../src/src.dart';

class SelectChapterScreen extends StatelessWidget {
  const SelectChapterScreen(
      {super.key,
      required this.subject,
      required this.classNumber,
      required this.subjectId});

  final String subject;

  final String subjectId;
  final String classNumber;

  @override
  Widget build(BuildContext context) {
    final EducationController controller = Get.find<EducationController>();
    controller.fetchChapters(subjectId);

    return Scaffold(
      appBar: AppBarWidget(title: subject, size: 55),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                elevation: WidgetStateProperty.all(1),
                hintText: 'Search for a specific chapter',
                hintStyle: WidgetStateProperty.all(
                  const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onChanged: (value) async =>
                    await controller.filterChapter(value),
                leading: Lottie.asset(
                  'assets/lottie/search_icon.json',
                  height: 30,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Chapter ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ThemeColors.darkBlueColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.chapters.value == null) {
                  Center(
                    child: Text(
                      'No chapters available for this subject.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                final List<Chapter> chapters =
                    controller.filteredChapter.isEmpty
                        ? controller.chapters.value?.data ?? []
                        : controller.filteredChapter;
                return controller.isLoadingChapters.value
                    ? Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final chapter =
                              controller.chapters.value!.data[index];

                          return buildChapterContainer(
                            index: index,
                            chapter: chapter,
                            onTap: () => RouteConfig.navigateToRTL(
                              context,
                              NotesMainScreen(
                                classNumber: classNumber,
                                subject: subject,
                                chapter: chapter.name,
                                chapterId: chapter.id,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: chapters.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                      );
              })
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildChapterContainer(
      {required VoidCallback onTap,
      required Chapter chapter,
      required int index}) {
    index++;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(chapter.logo),
                  fit: BoxFit.cover,
                ),
              ),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Text(
                '$index',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ThemeColors.darkBlueColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapter.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ThemeColors.darkBlueColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Text(
                  //   '32 notes',
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     fontSize: 14.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.double_arrow_outlined,
                color: ThemeColors.primaryBlueColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

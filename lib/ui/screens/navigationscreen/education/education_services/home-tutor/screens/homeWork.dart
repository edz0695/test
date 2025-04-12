import 'package:get/get.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../src/src.dart';
import 'homeWork_details.dart';

class HomeWork extends StatefulWidget {
  const HomeWork({super.key});

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final EducationController controller = Get.find<EducationController>();
    controller.fetchHomework();

    return Scaffold(
      appBar: const AppBarWidget(title: "Home Work", size: 30),
      body: Column(children: [
        SizedBox(
          height: 300,
          child: Lottie.network(
              "https://lottie.host/0af03de1-a122-4e66-bd97-28de5c7cdf1b/yNQ9f5b84H.json",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
        ),
        Obx(() {
          final homeworks = controller.homework.value?.data ?? [];
          return controller.isHomeworkLoading.value
              ? Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: loading(),
                )
              : Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemCount: homeworks.length,
                    itemBuilder: (context, index) {
                      final Homework homeWork = homeworks[index];
                      return buildSingleHomeWork(
                          size: size, homework: homeWork);
                    },
                  ),
                );
        })
      ]),
    );
  }

  Widget buildSingleHomeWork({required Size size, required Homework homework}) {
    printThis(homework.id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => Get.to(() => HomeWorkDetails(
              id: homework.id,
              teacherId: homework.createdBy,
            )),
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.indigo,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://ramximgs.sambhavapps.com/education/pd/1699581107765-50827917_1395512337293797_456388872754954240_n.png"),
                  ),
                ),
                width(20),
                Flexible(
                  child: Text(
                    homework.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ThemeColors.darkBlueColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

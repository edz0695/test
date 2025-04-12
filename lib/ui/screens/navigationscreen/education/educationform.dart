import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/services/apis/apiservice.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/student_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/jobs/jobScreen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/hire_form_screen.dart';
import '../../../../src/src.dart';
import 'education_services/i_am_teacher/teachers_home_screen.dart';
import 'hire_services/screens/hire_form_screen_private_jobs.dart';
import 'job_services/job_main_screen.dart';
import 'job_services_2/job_main_screen_two.dart';
import 'hire_services/build_resume_screen.dart';

class EducationFormScreen extends StatefulWidget {
  const EducationFormScreen({super.key, this.fromNAVBAR = false});
  final bool fromNAVBAR;

  @override
  State<EducationFormScreen> createState() => _EducationFormScreenState();
}

class _EducationFormScreenState extends State<EducationFormScreen>
    with AutomaticKeepAliveClientMixin<EducationFormScreen> {
  final valueNotifier = ValueNotifier<EducationType?>(null);
  final jobsCategoryNotifier = ValueNotifier<bool>(false);
  final List<TeachingStyle> _teachingStyles = [];
  final teachingStyleNotifier = ValueNotifier<List<TeachingStyle>>([]);
  final classNotifier = ValueNotifier<ClassesModel?>(null);
  final boardNotifier = ValueNotifier<BoardsModel?>(null);
  final mediumNotifier = ValueNotifier<MediumsModel?>(null);
  final showExams = ValueNotifier<bool>(false);
  final examsNotifier = ValueNotifier<List<ExamsModel>>([]);
  final List<ExamsModel> _selectedExamsList = [];
  var showHireOptions = false;
  var filteredMediums = [];

  @override
  void initState() {
    super.initState();
    final educationProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    educationProvider.getClasses();
    educationProvider.getBoards();
    // educationProvider.getMediums();
  }

  var jobCategories = [
    {"name": "Private Jobs", "widget": PrivateJobRecruiterForm()},
    {
      "name": "Private Jobs Against Education",
      "widget": const JobMainScreen2()
    },
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => EductionFormProvider(),
      child: Scaffold(
        appBar: widget.fromNAVBAR
            ? AppBar(
                leading: const SizedBox(),
              )
            : AppBar(
                title: const Text("Eduction Form"),
                centerTitle: true,
                leading: back(),
              ),
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ValueListenableBuilder<EducationType?>(
                          valueListenable: valueNotifier,
                          builder: (context, educationType, child) {
                            return buildFormFirstItemMethod(
                              label: "I'm a Student",
                              image: "assets/education/student.png",
                              lottie: 'assets/lottie/student.json',
                              onTap: () {
                                jobsCategoryNotifier.value = false;
                                valueNotifier.value = EducationType.student;
                              },
                              bg: educationType == EducationType.student
                                  ? ThemeColors.primaryBlueColor
                                  : Colors.white,
                              textColor: educationType == EducationType.student
                                  ? Colors.white
                                  : ThemeColors.primaryBlueColor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ValueListenableBuilder<EducationType?>(
                          valueListenable: valueNotifier,
                          builder: (context, educationType, child) {
                            return buildFormFirstItemMethod(
                              label: "I'm a Teacher",
                              image: "assets/education/teachers.png",
                              lottie: "assets/lottie/teacher.json",
                              onTap: () {
                                jobsCategoryNotifier.value = false;
                                valueNotifier.value = EducationType.teacher;
                              },
                              bg: educationType == EducationType.teacher
                                  ? ThemeColors.primaryBlueColor
                                  : Colors.white,
                              textColor: educationType == EducationType.teacher
                                  ? Colors.white
                                  : ThemeColors.primaryBlueColor,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ValueListenableBuilder<EducationType?>(
                          valueListenable: valueNotifier,
                          builder: (context, educationType, child) {
                            return buildFormFirstItemMethod(
                              label: "Get Job",
                              image: "assets/education/get-job.png",
                              onTap: () {
                                setState(() {
                                  showHireOptions = false;
                                  valueNotifier.value = EducationType.job;
                                });
                                jobsCategoryNotifier.value = true;
                              },
                              bg: educationType == EducationType.job
                                  ? ThemeColors.primaryBlueColor
                                  : Colors.white,
                              textColor: educationType == EducationType.job
                                  ? Colors.white
                                  : ThemeColors.primaryBlueColor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ValueListenableBuilder<EducationType?>(
                          valueListenable: valueNotifier,
                          builder: (context, educationType, child) {
                            return buildFormFirstItemMethod(
                              label: "I want to hire",
                              image: "assets/education/hire.png",
                              onTap: () {
                                setState(() {
                                  showHireOptions = false;
                                  valueNotifier.value = EducationType.hire;
                                });
                                jobsCategoryNotifier.value = true;
                              },
                              bg: educationType == EducationType.hire
                                  ? ThemeColors.primaryBlueColor
                                  : Colors.white,
                              textColor: educationType == EducationType.hire
                                  ? Colors.white
                                  : ThemeColors.primaryBlueColor,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                showHireOptions
                    ? Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 60,
                                height: 1,
                                color: const Color(0xffD0CFCE)),
                            const SizedBox(width: 15),
                            const Text(
                              "Select Option",
                              style: TextStyle(
                                fontSize: 14,
                                color: ThemeColors.darkBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                                width: 60,
                                height: 1,
                                color: const Color(0xffD0CFCE)),
                          ],
                        ),
                      )
                    : const SizedBox(),
                showHireOptions
                    ? GridView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 7,
                                crossAxisSpacing: 7,
                                childAspectRatio: 1.1),
                        children: List.generate(
                          2,
                          (index) => ValueListenableBuilder<List<ExamsModel>>(
                              valueListenable: examsNotifier,
                              builder: (context, selectedExamsList, child) {
                                return buildFormFirstItemMethod(
                                  label: [
                                    "Private Jobs",
                                    "Private Jobs Against Degree"
                                  ][index]
                                      .toString(),
                                  image: "assets/education/online-class.png",
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return [
                                          PrivateJobsRecruiterWithoutDegreeForm(),
                                          PrivateJobRecruiterForm(),
                                        ][index];
                                      },
                                    ));
                                  },
                                  bg: Colors.white,
                                  textColor: ThemeColors.primaryBlueColor,
                                );
                              }),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                ValueListenableBuilder<bool>(
                    valueListenable: jobsCategoryNotifier,
                    builder: (context, status, child) {
                      if (status) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "Select Job",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ThemeColors.darkBlueColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            GridView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 7,
                                      crossAxisSpacing: 7,
                                      childAspectRatio: 1.1),
                              children: List.generate(
                                2,
                                (index) =>
                                    ValueListenableBuilder<List<ExamsModel>>(
                                        valueListenable: examsNotifier,
                                        builder: (context, selectedExamsList,
                                            child) {
                                          return buildFormFirstItemMethod(
                                            label: jobCategories[index]["name"]
                                                .toString(),
                                            image:
                                                "assets/education/online-class.png",
                                            onTap: () {
                                              if (valueNotifier.value ==
                                                  EducationType.hire) {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) {
                                                    return [
                                                      RecruiterBuildResumeScreen(),
                                                      const JobMainScreen2(),
                                                      const JobScreen()
                                                    ][index];
                                                  },
                                                ));
                                              } else {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) {
                                                    return [
                                                      const JobMainScreen(),
                                                      const JobMainScreen2(),
                                                      const JobScreen()
                                                    ][index];
                                                  },
                                                ));
                                              }

                                              // Get.to(() =>
                                              // jobCategories[index]
                                              // ["widget"]);
                                              // if (selectedExamsList
                                              //     .contains(
                                              //     educationProvider
                                              //         .exams[
                                              //     index])) {
                                              //   _selectedExamsList
                                              //       .removeWhere((element) =>
                                              //   element ==
                                              //       educationProvider
                                              //           .exams[
                                              //       index]);
                                              //   examsNotifier
                                              //       .value =
                                              //       _selectedExamsList;
                                              // } else {
                                              //   _selectedExamsList.add(
                                              //       educationProvider
                                              //           .exams[
                                              //       index]);
                                              //   examsNotifier
                                              //       .value =
                                              //       _selectedExamsList;
                                              // }
                                              // examsNotifier
                                              //     .notifyListeners();
                                            },
                                            bg:
                                                // ? ThemeColors
                                                // .primaryBlueColor
                                                // :
                                                Colors.white,
                                            textColor:
                                                // selectedExamsList
                                                //                           .contains(
                                                //                           educationProvider
                                                //                               .exams[
                                                //                           index])
                                                //                           ?
                                                // Colors.white
                                                // :
                                                ThemeColors.primaryBlueColor,
                                          );
                                        }),
                              ),
                            )
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                ValueListenableBuilder<EducationType?>(
                    valueListenable: valueNotifier,
                    builder: (context, educationType, child) {
                      if (educationType == EducationType.teacher) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Teaching Methods",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ThemeColors.darkBlueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ValueListenableBuilder<
                                            List<TeachingStyle>>(
                                        valueListenable: teachingStyleNotifier,
                                        builder:
                                            (context, teachingStyles, child) {
                                          return buildFormFirstItemMethod(
                                            image:
                                                "assets/education/online-class.png",
                                            label: "Online ",
                                            bg: teachingStyles.contains(
                                                    TeachingStyle.online)
                                                ? ThemeColors.primaryBlueColor
                                                : Colors.white,
                                            textColor: teachingStyles.contains(
                                                    TeachingStyle.online)
                                                ? Colors.white
                                                : ThemeColors.primaryBlueColor,
                                            onTap: () {
                                              if (teachingStyles.contains(
                                                  TeachingStyle.online)) {
                                                _teachingStyles.removeWhere(
                                                    (element) =>
                                                        element ==
                                                        TeachingStyle.online);
                                                teachingStyleNotifier.value =
                                                    _teachingStyles;
                                              } else {
                                                _teachingStyles
                                                    .add(TeachingStyle.online);
                                                teachingStyleNotifier.value =
                                                    _teachingStyles;
                                              }
                                              teachingStyleNotifier
                                                  .notifyListeners();
                                            },
                                          );
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: ValueListenableBuilder<
                                            List<TeachingStyle>>(
                                        valueListenable: teachingStyleNotifier,
                                        builder:
                                            (context, teachingStyles, child) {
                                          return buildFormFirstItemMethod(
                                            label: "Offline ",
                                            image:
                                                "assets/education/offline-class.png",
                                            bg: teachingStyles.contains(
                                                    TeachingStyle.offline)
                                                ? ThemeColors.primaryBlueColor
                                                : Colors.white,
                                            textColor: teachingStyles.contains(
                                                    TeachingStyle.offline)
                                                ? Colors.white
                                                : ThemeColors.primaryBlueColor,
                                            onTap: () {
                                              if (teachingStyles.contains(
                                                  TeachingStyle.offline)) {
                                                _teachingStyles.removeWhere(
                                                    (element) =>
                                                        element ==
                                                        TeachingStyle.offline);
                                                teachingStyleNotifier.value =
                                                    _teachingStyles;
                                              } else {
                                                _teachingStyles
                                                    .add(TeachingStyle.offline);
                                                teachingStyleNotifier.value =
                                                    _teachingStyles;
                                              }
                                              teachingStyleNotifier
                                                  // ignore: invalid_use_of_protected_member
                                                  .notifyListeners();
                                            },
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (educationType == EducationType.student) {
                        return Consumer<EductionFormProvider>(
                            builder: (context, educationProvider, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 1,
                                        color: const Color(0xffD0CFCE)),
                                    const SizedBox(width: 15),
                                    const Text(
                                      "Select Class",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ThemeColors.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                        width: 60,
                                        height: 1,
                                        color: const Color(0xffD0CFCE)),
                                  ],
                                ),
                              ),
                              GridView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        childAspectRatio: 1.2 / .60),
                                children: List.generate(
                                  educationProvider.classes.length,
                                  (index) => ValueListenableBuilder<
                                          ClassesModel?>(
                                      valueListenable: classNotifier,
                                      builder: (context, selectedClass, child) {
                                        return buildSingleItemsMethod(
                                          label: educationProvider
                                              .classes[index].name,
                                          onTap: () {
                                            classNotifier.value =
                                                educationProvider
                                                    .classes[index];
                                          },
                                          bgColor: selectedClass ==
                                                  educationProvider
                                                      .classes[index]
                                              ? ThemeColors.primaryBlueColor
                                              : Colors.white,
                                          textColor: selectedClass ==
                                                  educationProvider
                                                      .classes[index]
                                              ? ThemeColors.white
                                              : ThemeColors.primaryBlueColor,
                                        );
                                        // return SelectionButton(
                                        //   label: educationProvider
                                        //       .classes[index].name,
                                        //   onTap: () {
                                        //     classNotifier.value =
                                        //         educationProvider.classes[index];
                                        //   },
                                        //   buttonColor: selectedClass ==
                                        //           educationProvider.classes[index]
                                        //       ? ThemeColors.blueColor
                                        //       : null,
                                        //   textColor: selectedClass ==
                                        //           educationProvider.classes[index]
                                        //       ? ThemeColors.white
                                        //       : null,
                                        // );
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 1,
                                        color: const Color(0xffD0CFCE)),
                                    const SizedBox(width: 15),
                                    const Text(
                                      "Select Board",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ThemeColors.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                        width: 60,
                                        height: 1,
                                        color: const Color(0xffD0CFCE)),
                                  ],
                                ),
                              ),
                              GridView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        childAspectRatio: 1.2 / .60),
                                children: List.generate(
                                  educationProvider.boards.length,
                                  (index) => ValueListenableBuilder<
                                          BoardsModel?>(
                                      valueListenable: boardNotifier,
                                      builder: (context, selectedBoard, child) {
                                        return buildSingleItemsMethod(
                                          label: educationProvider
                                              .boards[index].boardName,
                                          onTap: () {
                                            boardNotifier.value =
                                                educationProvider.boards[index];
                                          },
                                          bgColor: selectedBoard ==
                                                  educationProvider
                                                      .boards[index]
                                              ? ThemeColors.primaryBlueColor
                                              : Colors.white,
                                          textColor: selectedBoard ==
                                                  educationProvider
                                                      .boards[index]
                                              ? ThemeColors.white
                                              : ThemeColors.primaryBlueColor,
                                        );
                                        // return SelectionButton(
                                        //   label: educationProvider
                                        //       .classes[index].name,
                                        //   onTap: () {
                                        //     classNotifier.value =
                                        //         educationProvider.classes[index];
                                        //   },
                                        //   buttonColor: selectedClass ==
                                        //           educationProvider.classes[index]
                                        //       ? ThemeColors.blueColor
                                        //       : null,
                                        //   textColor: selectedClass ==
                                        //           educationProvider.classes[index]
                                        //       ? ThemeColors.white
                                        //       : null,
                                        // );
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 1,
                                        color: const Color(0xffD0CFCE)),
                                    const SizedBox(width: 15),
                                    const Text(
                                      "Select Medium",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ThemeColors.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                        width: 60,
                                        height: 1,
                                        color: const Color(0xffD0CFCE)),
                                  ],
                                ),
                              ),
                              GridView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        childAspectRatio: 1 / 0.85),
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(
                                  educationProvider.mediums.length,
                                  (index) =>
                                      ValueListenableBuilder<MediumsModel?>(
                                          valueListenable: mediumNotifier,
                                          builder:
                                              (context, selectedMedium, child) {
                                            //         buildFormMediumItemMethod(
                                            //           label: mediums[index]["name"],
                                            //           image: mediums[index]["logo"],
                                            //           onTap: () {},
                                            //           bg: Colors.white,
                                            //           textColor: ThemeColors
                                            //               .primaryBlueColor,
                                            //         ),
                                            return buildFormMediumItemMethod(
                                              label: educationProvider
                                                  .mediums[index].mediumName,
                                              onTap: () {
                                                mediumNotifier.value =
                                                    educationProvider
                                                        .mediums[index];
                                              },
                                              bg: selectedMedium ==
                                                      educationProvider
                                                          .mediums[index]
                                                  ? ThemeColors.primaryBlueColor
                                                  : Colors.white,
                                              textColor: selectedMedium ==
                                                      educationProvider
                                                          .mediums[index]
                                                  ? ThemeColors.white
                                                  : ThemeColors
                                                      .primaryBlueColor,
                                              image: educationProvider
                                                  .mediums[index].mediumLogo,
                                            );
                                            // return SelectionButton(
                                            //   label: educationProvider
                                            //       .classes[index].name,
                                            //   onTap: () {
                                            //     classNotifier.value =
                                            //         educationProvider.classes[index];
                                            //   },
                                            //   buttonColor: selectedClass ==
                                            //           educationProvider.classes[index]
                                            //       ? ThemeColors.blueColor
                                            //       : null,
                                            //   textColor: selectedClass ==
                                            //           educationProvider.classes[index]
                                            //       ? ThemeColors.white
                                            //       : null,
                                            // );
                                          }),
                                ),
                              ),
                              ValueListenableBuilder<bool>(
                                  valueListenable: showExams,
                                  builder: (context, status, child) {
                                    if (status) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.0),
                                            child: Text(
                                              "Select Exams",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    ThemeColors.darkBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          ValueListenableBuilder<ClassesModel?>(
                                            valueListenable: classNotifier,
                                            builder: (context, selectedClass,
                                                child) {
                                              if (educationProvider
                                                  .exams.isEmpty) {
                                                educationProvider.getExams(
                                                    classId: selectedClass!.id);
                                              }
                                              return GridView(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 15),
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        mainAxisSpacing: 7,
                                                        crossAxisSpacing: 7,
                                                        childAspectRatio:
                                                            1.2 / .75),
                                                children: List.generate(
                                                  educationProvider
                                                      .exams.length,
                                                  (index) => ValueListenableBuilder<
                                                          List<ExamsModel>>(
                                                      valueListenable:
                                                          examsNotifier,
                                                      builder: (context,
                                                          selectedExamsList,
                                                          child) {
                                                        return buildSingleItemsMethod(
                                                          label:
                                                              educationProvider
                                                                  .exams[index]
                                                                  .examName,
                                                          onTap: () {
                                                            if (selectedExamsList
                                                                .contains(
                                                                    educationProvider
                                                                            .exams[
                                                                        index])) {
                                                              _selectedExamsList
                                                                  .removeWhere((element) =>
                                                                      element ==
                                                                      educationProvider
                                                                              .exams[
                                                                          index]);
                                                              examsNotifier
                                                                      .value =
                                                                  _selectedExamsList;
                                                            } else {
                                                              _selectedExamsList.add(
                                                                  educationProvider
                                                                          .exams[
                                                                      index]);
                                                              examsNotifier
                                                                      .value =
                                                                  _selectedExamsList;
                                                            }
                                                            examsNotifier
                                                                .notifyListeners();
                                                          },
                                                          bgColor: selectedExamsList
                                                                  .contains(
                                                                      educationProvider
                                                                              .exams[
                                                                          index])
                                                              ? ThemeColors
                                                                  .primaryBlueColor
                                                              : Colors.white,
                                                          textColor: selectedExamsList
                                                                  .contains(
                                                                      educationProvider
                                                                              .exams[
                                                                          index])
                                                              ? Colors.white
                                                              : ThemeColors
                                                                  .primaryBlueColor,
                                                        );
                                                      }),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  })
                            ],
                          );
                        });
                      }
                      return const SizedBox();
                    }),
                height(20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        minimumSize: Size(Get.size.width * .3, 50)),
                    onPressed: () async {
                      printThis("value.value ${valueNotifier.value}");
                      if (valueNotifier.value == null) {
                        Get.snackbar(
                          'Careful!',
                          '',
                          titleText: const Text(
                            'Careful!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          messageText: const Text(
                            'Select a Form to continue!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          colorText: Colors.white,
                          backgroundColor: ThemeColors.darkBlueColor,
                          duration: const Duration(seconds: 4),
                          animationDuration: const Duration(seconds: 1),
                        );
                      }

                      if (valueNotifier.value == EducationType.teacher) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherHomeScreen()));
                      } else if (valueNotifier.value == EducationType.student &&
                          !showExams.value) {
                        var status = await showAlert(context);

                        if (status) {
                          showExams.value = true;
                        } else {
                          showLoaderDialog(context);
                          // Not PreParing For Competitive Exams Ap  hit
                          final loginSignUpProvider =
                              Provider.of<LoginSignUpProvider>(context,
                                  listen: false);
                          if (loginSignUpProvider.userModel != null) {
                            Map<String, dynamic> data = {
                              "user_id": loginSignUpProvider.userModel!.id,
                              "class_id": classNotifier.value!.id,
                              "board": boardNotifier.value,
                              "competitive": "0",
                            };
                            printThis(data);
                            ApiService.submitEducationForm(data: data)
                                .then((value) {
                              Get.back();
                              Get.back();
                            }).onError((error, stackTrace) {
                              Get.back();
                            });
                          }
                        }
                      } else if (valueNotifier.value == EducationType.student &&
                          showExams.value) {
                        Get.to(() => const StudentsDashboard());
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    )),
                height(100)
              ],
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingActionButton.extended(
        //   heroTag: "formFAB",
        //   onPressed: () async {
        //     printThis("value.value ${valueNotifier.value}");
        //     if (valueNotifier.value == null) {
        //       Get.snackbar(
        //         'Careful!',
        //         '',
        //         titleText: const Text(
        //           'Careful!',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 15.0,
        //             fontWeight: FontWeight.w800,
        //           ),
        //         ),
        //         messageText: const Text(
        //           'Select a Form to continue!',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 14.0,
        //             fontWeight: FontWeight.w800,
        //           ),
        //         ),
        //         colorText: Colors.white,
        //         backgroundColor: ThemeColors.darkBlueColor,
        //         duration: const Duration(seconds: 4),
        //         animationDuration: const Duration(seconds: 1),
        //       );
        //     }

        //     if (valueNotifier.value == EducationType.teacher) {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const TeacherHomeScreen()));
        //       // final loginSignUpProvider =
        //       //     Provider.of<LoginSignUpProvider>(context,
        //       //         listen: false);
        //       // Map<String, dynamic> data = {
        //       //   "user_id": loginSignUpProvider.userModel?.id,
        //       //   "type": "teacher",
        //       //   "teaching_type": List.generate(
        //       //       _teachingStyles.length,
        //       //       (index) =>
        //       //           _teachingStyles[index] == TeachingStyle.online
        //       //               ? "online"
        //       //               : "offline")
        //       // };
        //       // showLoaderDialog(context);
        //       // ApiService.submitEducationFormTeacher(data: data)
        //       //     .then((value) {
        //       //   Navigator.pop(context);
        //       //   Navigator.pop(context);
        //       // }).onError((error, stackTrace) {
        //       //   Navigator.pop(context);
        //       // });
        //     } else if (valueNotifier.value == EducationType.student &&
        //         !showExams.value) {
        //       var status = await showAlert(context);
        //       if (status) {
        //         showExams.value = true;
        //       } else {
        //         showLoaderDialog(context);
        //         // Not PreParing For Competitive Exams Ap  hit
        //         final loginSignUpProvider =
        //             Provider.of<LoginSignUpProvider>(context, listen: false);
        //         if (loginSignUpProvider.userModel != null) {
        //           Map<String, dynamic> data = {
        //             "user_id": loginSignUpProvider.userModel!.id,
        //             "class_id": classNotifier.value!.id,
        //             "board": boardNotifier.value,
        //             "competitive": "0",
        //           };
        //           printThis(data);
        //           ApiService.submitEducationForm(data: data).then((value) {
        //             Get.back();
        //             Get.back();
        //           }).onError((error, stackTrace) {
        //             Get.back();
        //           });
        //         }
        //       }
        //     } else if (valueNotifier.value == EducationType.student &&
        //         showExams.value) {
        //       Get.to(() => const StudentsDashboard());
        //     }

        //     // Hit The Main Student Api
        //     //   showLoaderDialog(context);
        //     //   // Not PreParing For Competitive Exams Ap  hit
        //     //   final loginSignUpProvider =
        //     //   Provider.of<LoginSignUpProvider>(context,
        //     //       listen: false);
        //     //   if (loginSignUpProvider.userModel != null) {
        //     //     Map<String, dynamic> data = {
        //     //       "user_id": loginSignUpProvider.userModel!.id,
        //     //       "class_id": classNotifier.value!.id,
        //     //       "board": boardNotifier.value,
        //     //       "competitive":"1",
        //     //       "competitive_exams": List.generate(
        //     //           _selectedExamsList.length,
        //     //               (index) =>_selectedExamsList[index].id),
        //     //     };
        //     //     printThis(data);
        //     //     ApiService.submitEducationForm(data:data).then((value) {
        //     //       Navigator.pop(context);
        //     //       Navigator.pop(context);
        //     //     }).onError((error, stackTrace) {
        //     //       Navigator.pop(context);
        //     //     });
        //     //   }
        //     // }
        //   },
        //   label: const Text(
        //     "              Submit              ",
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.normal,
        //         fontSize: 16),
        //   ),
        // ),
      ),
    );
  }

  InkWell buildSingleItemsMethod({
    required String label,
    required Color textColor,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
          //border: Border.all(width: 1, color: ThemeColors.blueColor),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ),
    );
  }

  InkWell buildFormMediumItemMethod({
    required String label,
    required String image,
    required VoidCallback onTap,
    required Color bg,
    required Color textColor,
    String? lottie,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            // BoxShadow(
            //     color: ThemeColors.primaryBlueColor.withOpacity(0.3),
            //     spreadRadius: 3,
            //     blurRadius: 5,
            //     offset: const Offset(0, 1)),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Colors.white,
                child: lottie != null
                    ? Lottie.asset(
                        lottie,
                        height: 60,
                        width: 60,
                      )
                    : Image.network(
                        image,
                        height: 50,
                        width: 50,
                      ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 14, color: textColor),
            )
          ],
        ),
      ),
    );
  }

  InkWell buildFormFirstItemMethod({
    required String label,
    required String image,
    required VoidCallback onTap,
    required Color bg,
    required Color textColor,
    String? lottie,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 20,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Colors.white,
                child: lottie != null
                    ? Lottie.asset(
                        lottie,
                        height: 60,
                        width: 60,
                      )
                    : Image.asset(
                        image,
                        height: 40,
                        width: 40,
                      ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  buildSelectSingleItems() {
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}

// Consumer<EductionFormProvider>(
// builder: (context, educationProvider, child){
// if(educationProvider.classSelected&&!educationProvider.boardSelected){
// return SelectBoardScreen();
// }
// else if(educationProvider.classSelected&&educationProvider.boardSelected&&!educationProvider.competitiveSelected){
// return SelectCompetitiveScreenWidget();
// }
// else{
// return GridView.builder(
// itemCount: educationProvider.classes.length,shrinkWrap: true,
// padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3,
// childAspectRatio: (1 / 1.3), crossAxisSpacing: 15,mainAxisSpacing: 15),
// itemBuilder: (BuildContext context, int index) {
// // for(var element in categoryProvider.adminCategories){
// //   if(categoryProvider.categories[index].id==element.categoryId){
// //     categoryProvider.categories[index].image = element.image;
// //   }
// // }
// return ClassesWidget(classesModel: educationProvider.classes[index],onTap: (){
//
// educationProvider.selectedClass = index;
// educationProvider.notifyListeners();
// printThis(educationProvider.selectedClass);
// }, selected: educationProvider.selectedClass!=null?index==educationProvider.selectedClass?true:false:false,);
// },);
// }
//
// }),
// Expanded(child: Container()),
// Consumer<EductionFormProvider>(
// builder: (context, educationProvider, child){
// return GradientButton(onTap: () async {
//
// if(educationProvider.selectedClass!=null&&!educationProvider.classSelected){
// educationProvider.classSelected = true;
// educationProvider.notifyListeners();
// }
// else if(!educationProvider.boardSelected&&educationProvider.selectedBoard!=null){
// var status = await showAlert(context);
// if(status){
// educationProvider.boardSelected = true;
// educationProvider.notifyListeners();
// }
// else{
// final userProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
// if(userProvider.userModel!=null){
// Map <String ,dynamic> data = {
// "user_id":userProvider.userModel!.id,
// "class_id": educationProvider.classes[educationProvider.selectedClass!].id,
// "board":educationProvider.boards[educationProvider.selectedBoard!],
// "competitive":"0",
// };
// showLoaderDialog(context);
// await educationProvider.submitForm(data: data);
// // await userProvider.getUser();
// Navigator.pop(context);
// Navigator.pop(context);
// printThis("No Competitive Api Hit Here");
// //Hit the Api
// printThis("Hit The Api");
// }
//
// }
//
// }
// else if(!educationProvider.competitiveSelected){
// printThis("Competitive");
// final List<bool> checkingList =
// educationProvider.selectionList.where((element) => element==true).toList();
// if(checkingList.isNotEmpty){
// printThis("Competitive Done");
// final userProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
// if(userProvider.userModel!=null){
// final List competitiveExams = [];
// for (int i = 0; i<educationProvider.exams.length; i++) {
// if(educationProvider.selectionList[i]){
// competitiveExams.add(educationProvider.exams[i].id);
// }
// }
// printThis(competitiveExams);
// Map <String ,dynamic> data = {
// "user_id":userProvider.userModel!.id,
// "class_id": educationProvider.classes[educationProvider.selectedClass!].id,
// "board":educationProvider.boards[educationProvider.selectedBoard!],
// "competitive":"1",
// "competitive_exams": competitiveExams
// };
// showLoaderDialog(context);
// await educationProvider.submitForm(data: data);
// // await userProvider.getUser();
// Navigator.pop(context);
// Navigator.pop(context);
//
// }
// }
// }
//
//
// },text: "Continue",);
// }),
//
// SizedBox(height: 40,),

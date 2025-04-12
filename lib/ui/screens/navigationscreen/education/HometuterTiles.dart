import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/teacherProfile.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../provider/education_providers/education_provider.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';

import '../../../widgets/hometutorwidget.dart';

class Hometuter extends StatefulWidget {
  const Hometuter({super.key});

  @override
  State<Hometuter> createState() => _HometuterState();
}

class _HometuterState extends State<Hometuter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tutorProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    tutorProvider.getHomeTutors();
    tutorProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(200),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.arrow_left,
                          size: 25,
                        ),
                      )),
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  "Home Tutors",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, letterSpacing: 1),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Consumer<EductionFormProvider>(
              builder: (context, tutorProvider, child) {
            return GridView.builder(
              itemCount: tutorProvider.isLoadingCategorised
                  ? 5
                  : tutorProvider.tutorList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 2.5),
              itemBuilder: (BuildContext context, int index) {
                return tutorProvider.isLoadingCategorised
                    ? const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ShimmerAnimation(
                          radius: 10,
                        ),
                      )
                    : HomeTutorWidget(
                        tutor: tutorProvider.tutorList[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => TeacherProfile(
                                        id: tutorProvider
                                            .tutorList[index].userId,
                                      )));
                        },
                        hired: false,
                      );
              },
            );
          }))
        ],
      ),
    ));
  }
}

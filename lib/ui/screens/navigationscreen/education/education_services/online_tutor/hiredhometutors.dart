import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/teacherProfile.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../widgets/hometutorwidget.dart';

class HiredhomeTutors extends StatefulWidget {
  const HiredhomeTutors({super.key});

  @override
  State<HiredhomeTutors> createState() => _HiredhomeTutorsState();
}

class _HiredhomeTutorsState extends State<HiredhomeTutors> {
  @override
  void initState() {
    super.initState();
    final tutorProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    final userProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    tutorProvider.getHiredHomeTutors(userId: userProvider.userModel!.id);
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
                  "Hired Home Tutors",
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
            return tutorProvider.isLoadingCategorised
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : GridView.builder(
                    itemCount: tutorProvider.hiredtutorList.length,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2 / 2.5),
                    itemBuilder: (context, index) {
                      return HomeTutorWidget(
                          tutor: tutorProvider.hiredtutorList[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeacherProfile(
                                          id: tutorProvider
                                              .hiredtutorList[index].userId,
                                        )));
                          },
                          hired: true);
                    },
                  );
            // }
            // else{
            //   return SizedBox(
            //     height: 50,
            //     child: Text('No hired Teachers ',style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05,),),
            //   );
            // }
          }))
        ],
      ),
    ));
  }
}

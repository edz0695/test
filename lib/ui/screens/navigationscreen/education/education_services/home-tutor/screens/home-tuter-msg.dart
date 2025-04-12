import 'package:flutter/material.dart';
import '../../../../../../../themes/colors.dart';
import '../../../../../../widgets/app_bar_widget.dart';

class HomeTutorMsg extends StatefulWidget {
  const HomeTutorMsg({super.key});

  @override
  State<HomeTutorMsg> createState() => _HomeTutorMsgState();
}

class _HomeTutorMsgState extends State<HomeTutorMsg> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: 'Messages from teachers', size: 55),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 5, bottom: 20, left: 5),
        child: Column(
          children: [
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '11:00 PM',
              image:
                  "https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg",
              isSeen: false,
            ),
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '09:00 PM',
              image:
                  "https://lh3.googleusercontent.com/n6-Hpe8OulMNy2a_yH0QHRN_TCJUSry7nb8ciKLea1qwrpDmMRYb6OwhVjm8HkC08CulG2akijNO5Oo5O1MBBQ=s1500-pp",
              isSeen: false,
            ),
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '09:00 PM',
              image:
                  "https://www.learningpotential.gov.au/sites/default/files/styles/large/public/2019-07/PS57-Meeting-teachers.jpg?itok=I1uESp_r",
              isSeen: true,
            ),
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '09:00 PM',
              image:
                  "https://www.nsba.org/-/media/ASBJ/2021/February/features/diverse-teachers-matter.jpg",
              isSeen: true,
            ),
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '11:00 PM',
              image:
                  "https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg",
              isSeen: false,
            ),
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '09:00 PM',
              image:
                  "https://lh3.googleusercontent.com/n6-Hpe8OulMNy2a_yH0QHRN_TCJUSry7nb8ciKLea1qwrpDmMRYb6OwhVjm8HkC08CulG2akijNO5Oo5O1MBBQ=s1500-pp",
              isSeen: false,
            ),
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '09:00 PM',
              image:
                  "https://www.learningpotential.gov.au/sites/default/files/styles/large/public/2019-07/PS57-Meeting-teachers.jpg?itok=I1uESp_r",
              isSeen: true,
            ),
            buildSingleMsg(
              size: size,
              teacherName: "Teacher Name",
              msg: "Hi, This is User. I want to talk with you.",
              time: '09:00 PM',
              image:
                  "https://www.nsba.org/-/media/ASBJ/2021/February/features/diverse-teachers-matter.jpg",
              isSeen: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSingleMsg({
    required Size size,
    required String teacherName,
    required String msg,
    required String time,
    required String image,
    required bool isSeen,
  }) {
    return Badge(
      backgroundColor: isSeen ? Colors.transparent : Colors.green,
      label: !isSeen
          ? const Text(
              "5",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Colors.white,
              ),
            )
          : null,
      alignment: Alignment.centerRight,
      offset: const Offset(-14, 12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        width: size.width,
        height: 80,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: [
        //     BoxShadow(
        //         offset: const Offset(1, 1),
        //         color: ThemeColors.blueColor.withOpacity(0.2),
        //         blurRadius: 5.0,
        //         spreadRadius: 3),
        //   ],
        // ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => CircleAvatar(
                    radius: 25,
                    backgroundColor:
                        ThemeColors.white.withOpacity(.6),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          teacherName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        time,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: size.width * .60,
                    child: Text(
                      msg,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSeen
                            ? Colors.black.withOpacity(0.6)
                            : Colors.black,
                        fontWeight: isSeen ? FontWeight.w400 : FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

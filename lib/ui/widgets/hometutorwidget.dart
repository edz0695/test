import 'package:flutter/material.dart';
import 'package:payapp/config/apiconfig.dart';
import 'package:payapp/models/hometutormodel.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/themes/colors.dart';
import 'package:provider/provider.dart';

import '../../provider/loginSignUpProvider.dart';
import '../../services/apis/apiservice.dart';
import '../dialogs/loaderdialog.dart';
import '../screens/navigationscreen/education/education_services/messages/chatscreen.dart';

class HomeTutorWidget extends StatelessWidget {
  final TutorModel tutor;
  final Function()? onTap;
  final hired;

  const HomeTutorWidget(
      {super.key, required this.tutor, this.onTap, required this.hired});

  // bool ishired = widget.hired?1:0;

  @override
  Widget build(BuildContext context) {
    bool ishired = hired;
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(Constants.baseUrl + tutor.image),
              radius: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(tutor.name,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 5,
            ),
            !ishired
                ? Text('₹${tutor.fee} / month',
                    style: const TextStyle(fontWeight: FontWeight.w600))
                : const SizedBox(
                    height: 1,
                  ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeColors.darkBlueColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                    child: Text(
                  tutor.subjects,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            !ishired
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ThemeColors.darkBlueColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          final loginSignUpProvider =
                              Provider.of<LoginSignUpProvider>(context,
                                  listen: false);
                          Map<String, dynamic> data = {
                            "student_id": loginSignUpProvider.userModel!.id,
                            "teacher_id": tutor.userId,
                          };
                          showLoaderDialog(context);
                          ApiService.studentjoinhometutor(data: data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }).onError((error, stackTrace) {
                            Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          'Join Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ThemeColors.darkBlueColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChatScreen(user_id: tutor.userId)));
                          },
                          child: const Text(
                            'Send Message',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

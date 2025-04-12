import 'package:flutter/material.dart';
import 'package:payapp/config/route_config.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/dialogs/videodialog.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/student_dashboard.dart';

showLoaderDialog(BuildContext context) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    content: Row(
      children: [
        const CircularProgressIndicator(
          backgroundColor: Colors.indigo,
        ),
        Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text("Please Wait...")),
      ],
    ),
  );
}

Widget loading({Color? color = Colors.indigo}) {
  return Center(
    child: CircularProgressIndicator(
      strokeWidth: 1,
      color: color,
    ),
  );
}

showAlert(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.02)),
        content: SizedBox(
          height: 120,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Are You Preparing For Competitive Exams ?",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                        RouteConfig.navigateToRTL(
                            context, const StudentsDashboard());
                      },
                      child: const Text('No'),
                    ),
                    OutlinedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              ThemeColors.primaryBlueColor)),
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: ThemeColors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showVideoDialog(BuildContext context, {required String videoUrl}) async {
  showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return VideoDialog(
          videoUrl: videoUrl,
        );
      });
}

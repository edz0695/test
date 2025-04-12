import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

class StudentsCoursesScreen extends StatelessWidget {
  const StudentsCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarWidget(title: 'Courses', size: 55),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ThemeColors.darkBlueColor.withOpacity(.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

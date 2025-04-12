import 'package:flutter/cupertino.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/provider/education_providers/education_provider.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/widgets/hometutorwidget.dart';
import 'package:provider/provider.dart';

import '../../i_am_teacher/teacher_screens/teacherProfile.dart';

class TeacherWishlistTab extends StatefulWidget {
  const TeacherWishlistTab({super.key});

  @override
  State<TeacherWishlistTab> createState() => _TeacherWishlistTabState();
}

class _TeacherWishlistTabState extends State<TeacherWishlistTab> {
  @override
  void initState() {
    super.initState();
    final tutorProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    final userProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    tutorProvider.getTeacherWishlistCart(
        userId: userProvider.userModel!.id, //userProvider.userModel!.id,
        objType: 'teacher',
        type: 'wishlist');
    tutorProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
        builder: (context, tutorProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: tutorProvider.isLoadingCategorised
              ? 5
              : tutorProvider.cartwishlisttutorList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.5,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return tutorProvider.isLoadingCategorised
                ? const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ShimmerAnimation(
                      radius: 10,
                    ),
                  )
                : HomeTutorWidget(
                    tutor: tutorProvider.cartwishlisttutorList[index],
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => TeacherProfile(
                                    id: tutorProvider
                                        .cartwishlisttutorList[index].userId,
                                  )));
                    },
                    hired: false,
                  );
          },
        ),
      );
    });
  }
}

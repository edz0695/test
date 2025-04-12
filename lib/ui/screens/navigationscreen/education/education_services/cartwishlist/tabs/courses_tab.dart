import 'package:flutter/material.dart';
import 'package:payapp/provider/education_providers/education_provider.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/online_tutor/tutorwidgets/batchtile.dart';
import 'package:provider/provider.dart';

class CourseCart extends StatefulWidget {
  const CourseCart({super.key});

  @override
  State<CourseCart> createState() => _CourseCartState();
}

class _CourseCartState extends State<CourseCart> {
  @override
  void initState() {
    super.initState();
    final cartProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    final userProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    cartProvider.getCourseWishlistCart(
        userId: "4", objType: 'course', type: 'cart');
    cartProvider.isLoadingCategorised = true;
  } ////// thi is initial

  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
      builder: (context, cartProvider, child) {
        return cartProvider.isLoadingCategorised
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.only(left: 15, right: 15, bottom: 100),
                itemCount: cartProvider.cartBatchList.length,
                itemBuilder: (context, index) {
                  return TutorBatchTile(
                    batch: cartProvider.cartBatchList[index],
                  );
                },
              );
      },
    );
  }
}

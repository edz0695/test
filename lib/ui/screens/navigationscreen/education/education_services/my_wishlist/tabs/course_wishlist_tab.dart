import 'package:flutter/material.dart';
import 'package:payapp/provider/education_providers/education_provider.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:provider/provider.dart';

import '../../online_tutor/tutorwidgets/batchtile.dart';

class CourseWishlistTab extends StatefulWidget {
  const CourseWishlistTab({super.key});

  @override
  State<CourseWishlistTab> createState() => _CourseWishlistTabState();
}

class _CourseWishlistTabState extends State<CourseWishlistTab> {
  @override
  void initState() {
    super.initState();
    final cartProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    final userProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    cartProvider.getCourseWishlistCart(
        userId: '1', //userProvider.userModel!.id,
        objType: 'course',
        type: 'wishlist');
    cartProvider.isLoadingCategorised = true;
  }

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
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
              itemCount: cartProvider.cartBatchList.length,
              itemBuilder: (context, index) {
                return TutorBatchTile(batch: cartProvider.cartBatchList[index]);
              });
    });
  }
}

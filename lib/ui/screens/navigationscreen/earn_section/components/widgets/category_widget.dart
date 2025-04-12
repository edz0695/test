import 'package:flutter/material.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/models/earncategorymodel.dart';

import '../../../../../../core/utils/helper/helper.dart';

class EarnCategoryWidget extends StatelessWidget {
  final EarnCategoryModel earnCategoryModel;
  final Function()? onTap;

  const EarnCategoryWidget(
      {super.key, required this.earnCategoryModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          highlightColor: Colors.transparent,
          splashColor: Colors.black.withOpacity(.035),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    earnCategoryModel.icon,
                    height: 70,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const ShimmerAnimation(
                        height: 60,
                        width: 60,
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => const Stack(
                      alignment: Alignment.center,
                      children: [
                        ShimmerAnimation(
                          height: 90,
                          width: 90,
                        ),
                        Text('Internet lost!'),
                      ],
                    ),
                  ),
                ),
                height(7),
                Center(
                  child: Text(
                    earnCategoryModel.categoryName,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: Colors.blue.shade50),
                  child: const Text(
                    'Earn Up to ₹ 500',
                    maxLines: 1,
                    style: TextStyle(fontSize: 10, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

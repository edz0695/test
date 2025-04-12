import 'package:flutter/material.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:provider/provider.dart';
import '../../../../../../provider/earn_providers/earn_screen_provider.dart';
import '../../sub_screens/all_offers_screen.dart';
import '../widgets/category_widget.dart';

class EarnCategoriesConsumer extends StatelessWidget {
  const EarnCategoriesConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EarnScreenProvider>(
      builder: (context, gmoProvider, child) {
        return GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemCount: gmoProvider.earnMainModel == null
              ? 10
              : gmoProvider.earnMainModel!.activeCategories.length,
          itemBuilder: (context, index) {
            return gmoProvider.earnMainModel == null
                ? const ShimmerAnimation(
                    height: 120,
                    width: 100,
                    radius: 15,
                  )
                : EarnCategoryWidget(
                    earnCategoryModel:
                        gmoProvider.earnMainModel!.activeCategories[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllOffersScreen(
                            categoryId: gmoProvider
                                .earnMainModel!.activeCategories[index].id,
                          ),
                        ),
                      );
                    },
                  );
          },
        );
      },
    );
  }
}

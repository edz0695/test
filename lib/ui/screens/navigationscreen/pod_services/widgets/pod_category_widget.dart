import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/helper/helper.dart';
import 'widgets.dart';

class PODCategoryWidget extends StatelessWidget {
  const PODCategoryWidget({
    super.key,
    required this.subcategories,
    required this.products,
  });

  final List subcategories;
  final List<Mug> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
              height: 110,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: subcategories.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(() => PODSubCategoryScreen(
                          categoryId: subcategories[index]['id'],
                          categoryName: subcategories[index]['cat_name'],
                        ));
                  },
                  child: SizedBox(
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.network(
                                  subcategories[index]['cat_img'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Text(subcategories[index]['cat_name'],
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          height(20),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.69 / 1),
                children: products.map((mug) => MugCard(mug: mug)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:get/get.dart';
import '../../../../../src/src.dart';
import '../../widgets/widgets.dart';

class GridItemsWidget extends StatelessWidget {
  const GridItemsWidget({
    super.key,
    required this.items,
    required this.image,
  });

  final List<GoldProductModel> items;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 270),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final gold = items[index];
        final url = gold.productImages.first.url;
        return Card(
            color: Colors.white,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  overlayColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              onPressed: () => Get.to(() => ProductDetailsPage(
                    desc: gold.description,
                    image: url,
                    title: gold.name,
                    price: gold.basePrice,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    height(10),
                    Card(
                      shape: const StadiumBorder(),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          url.isNotEmpty ? url : image,
                        ),
                      ),
                    ),
                    height(10),
                    Expanded(
                        child: Text(
                      gold.name,
                      softWrap: true,
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                    height(10),
                    Text(
                      gold.basePrice,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.indigo,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

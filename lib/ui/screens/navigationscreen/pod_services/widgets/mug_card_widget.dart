import 'package:flutter/material.dart';
import '../../../../../core/utils/helper/helper.dart';
import 'widgets.dart';

class MugCard extends StatelessWidget {
  final Mug mug;

  const MugCard({super.key, required this.mug});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductScreen(
            productModel: mug,
          ),
        ));
      },
      child: SizedBox(
        width: 200,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  mug.imageUrls[0],
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      mug.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    height(7),
                    Text('₹${mug.discountPrice}',
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    height(5),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent.withOpacity(0.2)),
                      child: Text(
                        '₹${mug.price}',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

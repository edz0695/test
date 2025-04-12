import 'package:flutter/material.dart';

import 'widgets.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.price,
  });
  final String title, desc, price;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        width: 155,
        color: Colors.white,
        isPadding: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              desc,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.indigo, fontWeight: FontWeight.w200),
            ),
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ],
        ));
  }
}

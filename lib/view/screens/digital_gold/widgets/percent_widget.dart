import 'package:flutter/material.dart';

import '../../../../core/utils/helper/helper.dart';

class PercentWidget extends StatelessWidget {
  const PercentWidget({
    super.key,
    required this.percent,
  });
  final String percent;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/triangle.png",
          width: 15,
          height: 10,
          color: Colors.green,
        ),
        width(5),
        Text(
          "$percent% since yesterday",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey, fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

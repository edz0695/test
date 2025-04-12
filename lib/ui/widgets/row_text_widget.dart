import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title, desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          desc,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    );
  }
}

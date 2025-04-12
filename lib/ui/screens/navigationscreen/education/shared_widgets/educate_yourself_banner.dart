import 'package:flutter/material.dart';

class EducateYourselfBanner extends StatelessWidget {
  const EducateYourselfBanner({super.key, this.educate});

  final String? educate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 0,
      ),
      child: Row(
        children: [
          Text(
            educate ?? "Educate yourself",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.person,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

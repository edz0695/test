import 'package:flutter/material.dart';

class TutorsAndCoachingAppBar extends StatelessWidget {
  const TutorsAndCoachingAppBar({super.key, required this.screenTitle});

  final String screenTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Navigator.pop(context),
            child : const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            screenTitle,
          style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}

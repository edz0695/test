import 'package:flutter/material.dart';

class HelloUserAndAccountRow extends StatelessWidget {
  final String userName;
  const HelloUserAndAccountRow({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            "Hello $userName ",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: Color(0xff333333)),
          ),
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Icons.person,
                color: Colors.grey,
                size: 30,
              )),
        ],
      ),
    );
  }
}

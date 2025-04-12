import 'package:flutter/material.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

class ComingSoonScreen extends StatelessWidget {
  final String title;

  const ComingSoonScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: title,
        size: 55,
      ),
      body: const Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/demo/navigation_provider.dart';
import 'package:provider/provider.dart';

class DemoNavHomeScreen extends StatelessWidget {
   DemoNavHomeScreen({super.key});

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title:  Text(provider.titles[provider.currentScreenIndex])),
          body: PageView.builder(
            onPageChanged: (index) => provider.changeCurrentScreen(index),
            itemBuilder:(context, index) => provider.screens[index],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payapp/screens/nav_screen.dart';

// void mainTube() {
//   ProviderScope(child: SambhavTube());
// }

class SambhavTube extends StatelessWidget {
  const SambhavTube({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter YouTube UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: const NavScreen(),
    );
  }
}

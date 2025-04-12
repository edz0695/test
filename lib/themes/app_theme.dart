import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeColors.primaryBlueColor,
    scaffoldBackgroundColor: ThemeColors.backgroundLightBlue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ThemeColors.backgroundLightBlue,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: ThemeColors.backgroundLightBlue,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(



      backgroundColor: ThemeColors.darkBlueColor,
      foregroundColor: Colors.white,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),



    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeColors.primaryBlueColor,
    scaffoldBackgroundColor: DarkThemeColors.background,
  );
}

// ThemeData lightTheme = ThemeData(
//   primarySwatch: WeLinkColors.myColor,
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme:  const AppBarTheme(
//     iconTheme: IconThemeData(color: Colors.white,),
//     actionsIconTheme: IconThemeData(
//       color: Colors.white,
//     ),
//     titleTextStyle: TextStyle(
//       color: Colors.white,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ),
//     backgroundColor: WeLinkColors.myColor,
//     elevation: 5.0,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: WeLinkColors.myColor,
//       statusBarBrightness: Brightness.light,
//     ),
//   ),
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     backgroundColor: WeLinkColors.myColor,
//   ),
//   bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: WeLinkColors.myColor,
//     unselectedItemColor: Colors.grey,
//     elevation: 30.0,
//     backgroundColor: Colors.white,
//   ),
//   textTheme:  const TextTheme(
//     bodyLarge: TextStyle(
//       fontSize: 14.5,
//       fontWeight: FontWeight.w600,
//       color: Colors.black,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 14.5,
//       fontWeight: FontWeight.w600,
//       color: Colors.black,
//       height: 1.0,
//     ),
//   ),
// );
//
//
//
// ThemeData darkTheme = ThemeData(
//   primarySwatch: WeLinkColors.myColor,
//   scaffoldBackgroundColor: HexColor('#18191A'),
//   appBarTheme: AppBarTheme(
//     actionsIconTheme: const IconThemeData(
//       color: Colors.white,
//     ),
//     titleTextStyle: const TextStyle(
//       color: Colors.white,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ),
//     iconTheme: const IconThemeData(
//       color: Colors.white,
//     ),
//     backgroundColor: HexColor('#18191A'),
//     elevation: 0.0,
//     systemOverlayStyle:  const SystemUiOverlayStyle(
//       statusBarColor: WeLinkColors.myColor,
//       statusBarBrightness: Brightness.dark,
//     ),
//   ),
//
//   floatingActionButtonTheme:  const FloatingActionButtonThemeData(
//     backgroundColor: WeLinkColors.myColor,
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: WeLinkColors.myColor,
//     unselectedItemColor: Colors.grey,
//     elevation: 30.0,
//     backgroundColor: HexColor('#18191A'),
//   ),
//   textTheme:  const TextTheme(
//     bodyLarge: TextStyle(
//       fontSize: 14.5,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//       height: 1.0,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 14.5,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//     ),
//   ),
// );

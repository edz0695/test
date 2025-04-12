import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payapp/util/app_constants.dart';

import '../themes/colors.dart';

ThemeData light({Color color = Colors.indigo}) => ThemeData(
      fontFamily: AppConstants.fontFamily,
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
      secondaryHeaderColor: const Color(0xFF1ED7AA),
      disabledColor: const Color(0xFFBABFC4),
      brightness: Brightness.light,
      hintColor: const Color(0xFF9F9F9F),
      cardColor: ThemeColors.backgroundLightBlue,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
      colorScheme: ColorScheme.light(primary: color, secondary: color)
          .copyWith(surface: const Color(0xFFFCFCFC))
          .copyWith(error: const Color(0xFFE84D4F)),
    );

import 'package:flutter/material.dart';
import 'package:payapp/util/app_constants.dart';

import '../themes/colors.dart';

ThemeData dark({Color color = Colors.indigo}) => ThemeData(
      fontFamily: AppConstants.fontFamily,
      primaryColor: color,
      secondaryHeaderColor: Colors.indigo,
      disabledColor: const Color(0xffa2a7ad),
      brightness: Brightness.dark,
      hintColor: const Color(0xFFbebebe),
      cardColor: ThemeColors.backgroundLightBlue,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
      colorScheme: ColorScheme.dark(primary: color, secondary: color)
          .copyWith(surface: const Color(0xFF191A26))
          .copyWith(error: const Color(0xFFdd3135)),
    );

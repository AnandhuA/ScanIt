import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    primaryColor: AppColors.primaryColor,

    scaffoldBackgroundColor: AppColors.backgroundLight,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textBlack),
      bodyMedium: TextStyle(color: AppColors.textBlack),
      titleLarge: TextStyle(color: AppColors.textBlack),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    primaryColor: AppColors.primaryColor,

    scaffoldBackgroundColor: AppColors.backgroundDark,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textWhite),
      bodyMedium: TextStyle(color: AppColors.textWhite),
      titleLarge: TextStyle(color: AppColors.textWhite),
    ),
  );
}

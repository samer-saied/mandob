import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.white,
      //appBar theme
      appBarTheme: const AppBarTheme(
          color: AppColors.black,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: AppColors.white,
          )),
      //text theme
      textTheme: TextTheme(
        displayLarge: boldStyle(),
        displayMedium: regularStyle(),
      ),
      //button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          iconColor: AppColors.white,
          textStyle: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      //text field
      inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //fouced border
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //error border
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //hint
        hintStyle: boldStyle(color: AppColors.grey, fontSize: 16),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            AppColors.grey,
          ),
          textStyle: WidgetStateProperty.all(
              boldStyle(color: AppColors.grey, fontSize: 16)),
        ),
      ));
}

import 'package:flutter/material.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/theme/app_colors.dart';

class AppTheme {
  // lightTheme here -------
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle:const TextStyle(fontSize:20,fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );
  
  //Dark Theme here --------
   static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor:Colors.transparent,
          contentPadding: const EdgeInsets.all(30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:const BorderSide(
              color: Colors.white,
              width: 0.4
            )
          )
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation:0,
        textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );
}
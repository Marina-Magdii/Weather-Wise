import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_wise/Core/ColorsManager.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: "Almarai",
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 40.sp,
        fontFamily: "Almarai",
      ),
      titleMedium:  TextStyle(
        color: Colors.white,
        fontSize: 23.sp,
        fontFamily: "Almarai",
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
        fontFamily: "Almarai",
      )
    )
  );
}
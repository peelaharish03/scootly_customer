import 'package:flutter/material.dart';
import 'package:scootly_customer/core/constants/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  hintColor: Colors.amber,
  scaffoldBackgroundColor: AppColor.fullwhite,
  appBarTheme: AppBarTheme(
    color: AppColor.blue,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColor.black),
    bodyMedium: TextStyle(color: AppColor.black1),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  hintColor: Colors.redAccent,
  scaffoldBackgroundColor: AppColor.black,
  appBarTheme: const AppBarTheme(
    color: Colors.blueGrey,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blueGrey,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColor.white),
    bodyMedium: const TextStyle(color: Colors.white70),
  ),
);

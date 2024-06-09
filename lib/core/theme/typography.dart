import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 57.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),
  displayMedium: TextStyle(
      fontSize: 45.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),
  displaySmall: TextStyle(
      fontSize: 36.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),

  ///headline
  headlineLarge: TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),
  headlineMedium: TextStyle(
      fontSize: 28.sp, fontWeight: FontWeight.w500, fontFamily: "Recursive"),
  headlineSmall: TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),

  ///title
  titleLarge: TextStyle(
      fontSize: 22.sp, fontWeight: FontWeight.w500, fontFamily: "Recursive"),
  titleMedium: TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w500, fontFamily: "Recursive"),
  titleSmall: TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, fontFamily: "Recursive"),

  ///label
  labelLarge: TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, fontFamily: "Recursive"),
  labelMedium: TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w500, fontFamily: "Recursive"),
  labelSmall: TextStyle(
      fontSize: 11.sp, fontWeight: FontWeight.w500, fontFamily: "Recursive"),

  ///body
  bodyLarge: TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),
  bodyMedium: TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),
  bodySmall: TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive"),
);

extension TextThemExtension on TextTheme {
  TextStyle get textTitle => TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: "Recursive");
}

extension FamilyUtils on TextStyle {
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
}

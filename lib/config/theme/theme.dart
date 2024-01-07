import 'package:flutter/material.dart';
import './colors.dart';
import './fonts.dart';

ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: AppColor.kPrimaryColor);

// text theme
TextTheme textTheme() {
  return TextTheme(
    headlineLarge: AppFonts.kFontFamily.copyWith(
        fontSize: AppFonts.kHeadlineLarge, fontWeight: AppFonts.kMedium),
    headlineMedium: AppFonts.kFontFamily.copyWith(
        fontSize: AppFonts.kHeadlineMedium, fontWeight: AppFonts.kSemibold),
    headlineSmall: AppFonts.kFontFamily.copyWith(
        fontSize: AppFonts.kHeadlineSmall, fontWeight: AppFonts.kMedium),
    titleLarge: AppFonts.kFontFamily.copyWith(
        fontSize: AppFonts.kFontTitleLarge,
        fontWeight: AppFonts.kSemibold,
        color: AppColor.kBlack),
    titleMedium: AppFonts.kFontFamily.copyWith(
        fontSize: AppFonts.kFontTitleMedium, fontWeight: AppFonts.kSemibold),
    titleSmall: AppFonts.kFontFamily.copyWith(
        fontSize: AppFonts.kFontTitleSmall, fontWeight: FontWeight.bold),
    bodyLarge: AppFonts.kFontFamily.copyWith(
        fontSize: AppFonts.kFontBodyLarge, fontWeight: FontWeight.bold),
    bodyMedium:
        AppFonts.kFontFamily.copyWith(color: AppColor.kBodyText, fontSize: 16),
    bodySmall: AppFonts.kFontFamily
        .copyWith(fontSize: 10, fontWeight: FontWeight.w500),
    displayMedium: AppFonts.kFontFamily
        .copyWith(fontSize: AppFonts.kFontDisplayMedium, color: AppColor.kGray),
    displaySmall: AppFonts.kFontFamily
        .copyWith(fontSize: AppFonts.kFontDisplaySmall, color: AppColor.kGray),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    foregroundColor: AppColor.kAppBarColor,
    backgroundColor: AppColor.kTransparent,
  );
}

ThemeData lightTheme = ThemeData(
  colorScheme: kColorScheme,
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: appBarTheme(),
  textTheme: textTheme(),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.kTransparent,
    centerTitle: true,
    foregroundColor: AppColor.kBlack,
  ),
);

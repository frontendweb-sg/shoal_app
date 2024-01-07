import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle kFontFamily = GoogleFonts.poppins();

  static const double kHeadlineLarge = 40;
  static const double kHeadlineMedium = 24;
  static const double kHeadlineSmall = 20;

  static const double kFontTitleLarge = 18;
  static const double kFontTitleMedium = 16;
  static const double kFontTitleSmall = 14;

  static const double kFontBodyLarge = kFontTitleMedium;
  static const double kFontBodyMedium = kFontTitleSmall;
  static const double kFontBodySmall = 10;

  static const double kFontDisplayLarge = 40;
  static const double kFontDisplayMedium = 12;
  static const double kFontDisplaySmall = 9;

  static const double kFontLabelLarge = kFontTitleSmall;

  static const FontWeight kNormal = FontWeight.normal;
  static const FontWeight kLight = FontWeight.w300;
  static const FontWeight kMedium = FontWeight.w500;
  static const FontWeight kSemibold = FontWeight.w600;
  static const FontWeight kBold = FontWeight.bold;
}

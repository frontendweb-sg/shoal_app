import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  ///
  /// App theme colors
  ///
  static const Color kRed = Colors.red;
  static const Color kBlack = Colors.black;
  static const Color kWhite = Colors.white;

  static const Color kGray = Color.fromRGBO(82, 82, 82, 1);
  static const Color kBodyText = Color.fromRGBO(0, 0, 0, 0.5);
  static const Color kPrimaryColor = Color.fromRGBO(113, 99, 253, 1);
  static const Color kSecondaryColor = Color.fromRGBO(1, 186, 179, 1);
  static const Color kLightGreen = Color.fromRGBO(214, 247, 231, 1);
  static const Color kAppBarColor = Color.fromRGBO(18, 16, 61, 1);
  static const Color kTextGray = Color.fromARGB(255, 156, 164, 171);
  static const Color kLighterGreen = Color.fromRGBO(174, 255, 215, 1);
  static const Color kGrayLight = Color.fromARGB(255, 240, 241, 243);
  static const Color kInputBg = Color.fromRGBO(196, 196, 196, 0.20);
  static const Color kGreen = Color.fromARGB(255, 6, 178, 23);
  static const Color kBorderColor = Color.fromARGB(255, 226, 228, 229);
  static const Color kCardBorderColor = Color.fromRGBO(227, 233, 237, 1);
  static const Color kCardHighlightColor = Color.fromRGBO(233, 254, 239, 1);
  static const Color kCardHoverBorderColor = Color.fromRGBO(51, 217, 134, 1);
  static const Color kTransparent = Colors.transparent;
  static const Color kSnakbarBg = Color.fromRGBO(0, 0, 0, 0.8);
  static const Color kDarkGreen = Color.fromRGBO(27, 66, 76, 1);

  /// buttons
  static const Color kSecondaryButtonColor = Color.fromRGBO(42, 104, 119, 1);
  static const Color kSecondaryButtonBorderColor =
      Color.fromRGBO(42, 104, 119, 0.49);

  static const Color kBottomNavigationSelectedColor = kPrimaryColor;
  static const Color kBottomNavigationBackground = Colors.white;
  static const Color kBottomNavigationUnselectedColor =
      Color.fromARGB(255, 172, 174, 190);
  static const Color kBottomNavigationBorderColor =
      Color.fromARGB(100, 172, 174, 190);
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.center,
    end: Alignment.center,
    colors: [
      Color.fromRGBO(0, 0, 0, 0),
      Color.fromRGBO(0, 0, 0, 0.04),
      Color.fromRGBO(1, 0, 0, 0.04),
      Color.fromARGB(255, 212, 244, 228)
    ],
  );

// primary button
  static TextStyle btnPrimary = GoogleFonts.poppins(
      color: kGreen, fontWeight: FontWeight.bold, fontSize: 20);
}

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import './colors.dart';

InputDecoration inputDecoration(BuildContext context,
    {String? hintText, IconData? icon, String? imageIcon = ''}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon:
        imageIcon != "" ? ImageIcon(AssetImage(imageIcon!)) : Icon(icon),
    fillColor: AppColor.kInputBg,
    filled: true,
    hintStyle: Theme.of(context).textTheme.bodyMedium,
    contentPadding: const EdgeInsets.all(15.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
  );
}

BoxDecoration decoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [AppColor.kLighterGreen, AppColor.kLighterGreen, AppColor.kWhite],
    ),
  );
}

DotsDecorator dotDecoration() {
  return DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(36.0, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

DotsDecorator loanDotDecoration(BuildContext context, int screens) {
  double width = MediaQuery.of(context).size.width / screens - 30.0;
  return DotsDecorator(
    sizes: [
      Size(width, 10),
      Size(width, 10),
      Size(width, 10),
    ],
    shape: const BeveledRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(3.0),
      ),
    ),
    activeSize: Size(width, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

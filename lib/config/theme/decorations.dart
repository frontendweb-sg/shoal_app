import 'package:flutter/material.dart';
import './colors.dart';

InputDecoration inputDecoration(BuildContext context,
    {String? hintText, IconData? icon, String? imageIcon}) {
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

import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';

Widget errorMessage(String message) {
  return Container(
    margin: const EdgeInsets.only(top: 25.0),
    width: double.infinity,
    padding: const EdgeInsets.all(20.0),
    child: Text(
      message,
      style: const TextStyle(color: AppColor.kRed, fontSize: 16),
    ),
  );
}

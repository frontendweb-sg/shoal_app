import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';

void toaster(
  BuildContext context, {
  required String msg,
  Color? color = AppColor.kSnakbarBg,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      backgroundColor: color,
      duration: const Duration(
        seconds: 40,
      ),
      content: Text(msg),
    ),
  );
}

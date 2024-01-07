import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';

void toaster(BuildContext context, {required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      backgroundColor: AppColor.kSnakbarBg,
      duration: const Duration(
        seconds: 20,
      ),
      content: Text(msg),
    ),
  );
}

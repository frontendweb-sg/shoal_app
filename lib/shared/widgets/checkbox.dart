import 'package:shoal_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

Widget checkBox(
  BuildContext context, {
  required String title,
  required bool? value,
  required void Function(bool?)? onChanged,
  }) {
       return CheckboxListTile(             
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0.0),
        activeColor: AppColor.kPrimaryColor,
        checkColor: AppColor.kWhite,
        title: Align(alignment: const Alignment(-1.1, 0), child: Text(title)),   
        value: value,
        onChanged: onChanged,
        );
  }
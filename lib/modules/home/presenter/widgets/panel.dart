import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/i18n/contents.dart';

Widget panelCard(
  BuildContext context, {
  required Function() onPressed,
  required String label,
  String? image,
  Icon? icon,
}) {
  return Ink(
    decoration: BoxDecoration(
      color: AppColor.kTransparent,
      border: Border.all(
        color: AppColor.kCardBorderColor,
        style: BorderStyle.solid,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      highlightColor: AppColor.kCardHighlightColor,
      onTap: () {
        print("HI");
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 54.81,
              height: 54.81,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppColor.kGrayLight,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SvgPicture.asset(image!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: textBodyLarge(
                context,
                label: label,
                color: AppColor.kBlack,
              ),
            ),
            textDisplayMedium(context, label: AppContent.strClickToKnowMore)
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';

Widget horizontalPanel(BuildContext context) {
  return Container(
    height: 82.0,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    decoration: BoxDecoration(
      color: AppColor.kLightGreen,
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Row(
      children: [
        Container(
          width: 66.68,
          height: 56,
          color: AppColor.kGrayLight,
          child: SvgPicture.asset(AppImage.imgSharingIcon),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textDisplayMedium(
                context,
                color: AppColor.kBlack,
                label: AppContent.strSharingCaring,
              ),
              const SizedBox(height: 10.0),
              textBodySmall(
                context,
                label: AppContent.strShareContent,
              )
            ],
          ),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';

class StepCard extends StatelessWidget {
  const StepCard({
    super.key,
    required this.label,
    this.icon = Icons.credit_card,
    this.isActive,
    this.activeBg,
  });

  final IconData? icon;
  final String label;
  final bool? isActive;
  final Color? activeBg;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive! ? AppColor.kGrayLight : AppColor.kWhite,
        border: Border.all(
          color: isActive! ? AppColor.kGreen : AppColor.kBorderColor,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(
            height: 5,
          ),
          textBodySmall(context, label: label),
          isActive!
              ? Checkbox(
                  fillColor: const MaterialStatePropertyAll(AppColor.kGreen),
                  shape: const CircleBorder(),
                  value: true,
                  onChanged: (v) {},
                )
              : Radio(
                  fillColor: const MaterialStatePropertyAll(AppColor.kGreen),
                  value: true,
                  groupValue: true,
                  onChanged: (v) {},
                ),
        ],
      ),
    );
  }
}

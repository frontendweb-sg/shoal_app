import 'package:flutter/material.dart';
import './colors.dart';

///
/// Text body large
/// font-size: 16
///
Widget textBodyLarge(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kPrimaryColor,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: color,
        ),
  );
}

///
/// Text body medium
/// font-size: 14
///
Widget textBodyMedium(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kPrimaryColor,
  FontWeight? fontWeight = FontWeight.w600,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
  );
}

///
/// Text body medium
/// font-size: 14
///
Widget textBodySmall(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kPrimaryColor,
  FontWeight? fontWeight,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
  );
}

///
/// Text body medium
/// font-size: 14
///
Widget textDisplayLarge(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kPrimaryColor,
  FontWeight? fontWeight,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.displayLarge!.copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
  );
}

///
/// Text body medium
/// font-size: 14
///
Widget textDisplayMedium(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kPrimaryColor,
  FontWeight? fontWeight,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.displayMedium!.copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
  );
}

///
/// Text body medium
/// font-size: 14
///
Widget textDisplaySmall(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kPrimaryColor,
  FontWeight? fontWeight,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
  );
}

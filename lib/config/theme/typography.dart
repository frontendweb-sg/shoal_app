import 'package:flutter/material.dart';
import '../../config/theme/colors.dart';

///
/// Headline large
/// font-size: 40
///
Widget textHedlineLarge(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
  FontWeight? fontWeight = FontWeight.w500,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: color,
        ),
  );
}

///
/// Headline medium
/// font-size: 24
///
Widget textHedlineMedium(BuildContext context,
    {required String label,
    Color? color = AppColor.kBodyText,
    FontWeight? fontWeight = FontWeight.w600,
    TextAlign? align}) {
  return Text(
    label,
    textAlign: align,
    softWrap: true,
    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: color,
        ),
  );
}

///
/// Headline small
/// font-size: 20
///
Widget textHedlineSmall(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
  FontWeight? fontWeight = FontWeight.normal,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: color,
        ),
  );
}

///
/// Title large
/// font-size: 24
///
Widget textTitleLarge(BuildContext context,
    {required String label,
    Color? color = AppColor.kBodyText,
    FontWeight? fontWeight = FontWeight.normal,
    TextAlign? align}) {
  return Text(
    label,
    textAlign: align,
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color,
        ),
  );
}

///
/// Title medium
/// font-size: 18
///
Widget textTitleMedium(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
  FontWeight? fontWeight = FontWeight.normal,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: color,
        ),
  );
}

///
/// Title small
/// font-size: 14
///
Widget textTitleSmall(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
  FontWeight? fontWeight = FontWeight.normal,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: color,
        ),
  );
}

///
/// Text body large
/// font-size: 16
///
Widget textBodyLarge(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
  Color? color = AppColor.kBodyText,
  FontWeight? fontWeight = FontWeight.w700,
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
/// font-size: 10
///
Widget textBodySmall(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
  FontWeight? fontWeight,
}) {
  return Text(
    label,
    softWrap: true,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
  );
}

///
/// Display medium
/// font-size: 14
///
Widget textDisplayLarge(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
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
/// Display medium
/// font-size: 12
///
Widget textDisplayMedium(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
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
/// Display small
/// font-size: 9
///
Widget textDisplaySmall(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
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

///
/// Display small
/// font-size: 9
///
Widget textLabelLarge(
  BuildContext context, {
  required String label,
  Color? color = AppColor.kBodyText,
  FontWeight? fontWeight,
}) {
  return Text(
    label,
    style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
  );
}

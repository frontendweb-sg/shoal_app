import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';

enum Variant { contained, outlined, text, defaultButton }

///
/// Button
///
Widget button(
  BuildContext context, {
  Variant? variant,
  required Function() onPressed,
  String? label,
  Widget? child,
  Color? bgColor,
  Color? textColor,
  double? height = 58,
  double? width = double.infinity,
  ButtonStyle? style,
  double? elevation = 5.0,
}) {
  bgColor = bgColor ??
      (variant == Variant.outlined
          ? AppColor.kSecondaryButtonBorderColor
          : AppColor.kPrimaryColor);

  textColor = textColor ??
      (variant == Variant.outlined
          ? AppColor.kSecondaryButtonColor
          : AppColor.kWhite);

  return switch (variant) {
    Variant.outlined => outlineButton(context,
        onPressed: onPressed,
        label: label,
        child: child,
        bgColor: bgColor,
        textColor: textColor,
        height: height,
        width: width,
        style: style,
        elevation: elevation),
    Variant.text => textButton(
        context,
        onPressed: onPressed,
        label: label,
        child: child,
        bgColor: bgColor,
        textColor: textColor,
        height: height,
        width: width,
        style: style,
        elevation: elevation,
      ),
    _ => filledButton(
        context,
        onPressed: onPressed,
        label: label,
        child: child,
        bgColor: bgColor,
        textColor: textColor,
        height: height,
        width: width,
        style: style,
        elevation: elevation,
      )
  };
}

Widget filledButton(BuildContext context,
    {required Function() onPressed,
    String? label,
    Widget? child,
    Color? bgColor,
    Color? textColor,
    double? height,
    double? width,
    ButtonStyle? style,
    double? elevation}) {
  if (Platform.isMacOS) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: child!,
    );
  }

  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            elevation: MaterialStatePropertyAll(elevation),
            backgroundColor: MaterialStatePropertyAll(bgColor!),
            foregroundColor: MaterialStatePropertyAll(textColor!),
          ),
      child: child ?? textLabelLarge(context, label: label!, color: textColor),
    ),
  );
}

Widget outlineButton(
  BuildContext context, {
  required Function() onPressed,
  String? label,
  Widget? child,
  Color? bgColor,
  Color? textColor,
  double? height,
  double? width,
  ButtonStyle? style,
  double? elevation,
}) {
  if (Platform.isMacOS) {
    return CupertinoButton(
      onPressed: onPressed,
      child: child!,
    );
  }
  return SizedBox(
    width: width,
    height: height,
    child: OutlinedButton(
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(bgColor!),
            side: MaterialStatePropertyAll(
              BorderSide(color: bgColor, style: BorderStyle.solid, width: 2),
            ),
          ),
      child: child ?? textLabelLarge(context, label: label!, color: textColor),
    ),
  );
}

Widget textButton(
  BuildContext context, {
  required Function() onPressed,
  String? label,
  Widget? child,
  Color? bgColor,
  Color? textColor,
  double? height,
  double? width,
  ButtonStyle? style,
  double? elevation,
}) {
  return TextButton(
    onPressed: onPressed,
    style: style,
    child: child ??
        textLabelLarge(
          context,
          label: label!,
          color: bgColor,
        ),
  );
}

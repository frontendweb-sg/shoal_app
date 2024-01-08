import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:shoal_app/config/theme/decorations.dart';

Widget stepper(BuildContext context, {int? screen = 3}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 40.0),
    child: DotsIndicator(
      dotsCount: 3,
      decorator: loanDotDecoration(context, screen!),
    ),
  );
}

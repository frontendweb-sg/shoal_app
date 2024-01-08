import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/typography.dart';

import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/modules/home/presenter/pages/home.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/navbar.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 202,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.imgGirlGrop),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textHedlineLarge(context, label: AppContent.strSuccess),
            const SizedBox(
              height: 10,
            ),
            textBodyMedium(context, label: AppContent.strRequestSent),
            const SizedBox(
              height: 20,
            ),
            button(context, label: AppContent.strContinue, onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (builder) => const HomeScreen(),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

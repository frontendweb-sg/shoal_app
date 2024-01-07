import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/core/i18n/contents.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: decoration(),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {},
          children: [buildContent(), buildContent(), buildContent()],
        ),
      ),
    );
  }

  Widget buildContent({
    required int index,
    required String image,
    required String label,
    required PageController controller,
  }) {
    void onNext(Widget routePage) {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(microseconds: 300),
          curve: Curves.linear,
        );
      } else {
        // Globals.storageService
        //     .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
        // navigate to signup screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (build) => routePage,
          ),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.all(25.0),
      width: MediaQuery.of(context).size.width - 50.0,
      height: MediaQuery.of(context).size.height - 50.0,
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            image.split(".")[1] == "png"
                ? Image.asset(image)
                : SvgPicture.asset(image),
            const SizedBox(
              height: 90,
            ),
            textHedlineMedium(
              context,
              align: TextAlign.center,
              color: AppColor.kBlack,
              label: label,
            ),
            const SizedBox(
              height: 90,
            ),
            // const CircleAvatar(
            //   backgroundColor: AppColor.kPrimaryColor,
            //   foregroundColor: AppColor.kWhite,
            //   child: Icon(Icons.arrow_forward_ios),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: DotsIndicator(
                decorator: dotDecoration(),
                position: ref.watch(indexDotProvider),
                dotsCount: 3,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            button(context,
                onPressed: () => onNext(const RegisterScreen()),
                label: index == 3 ? AppContent.strSignup : AppContent.strNext),
            const SizedBox(
              height: 5,
            ),
            if (index == 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textDisplayMedium(context,
                      label: AppContent.strAlreadyHaveAccount),
                  button(
                    context,
                    variant: Variant.text,
                    onPressed: () => onNext(const LoginScreen()),
                    label: AppContent().strLoginText,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

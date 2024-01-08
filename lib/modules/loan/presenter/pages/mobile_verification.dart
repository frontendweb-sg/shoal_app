import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/shared/widgets/wrapper.dart';

class MobileVerification extends StatelessWidget {
  const MobileVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        children: [
          textTitleLarge(context, label: AppContent.strVerifyMobileTitle),
          const SizedBox(
            height: 15,
          ),
          textBodyMedium(context, label: AppContent.strVerifyMobileText),
          const SizedBox(
            height: 15,
          ),
          securityBox(),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'By signing up, you are agreeing to our Terms & Conditions and Privacy Policy.',
            softWrap: true,
          ),
          const SizedBox(
            height: 15,
          ),
          textBodyMedium(
            context,
            label: 'Last visited ${DateTime.now()}',
          )
        ],
      ),
    );
  }

  Container securityBox() {
    return Container(
      padding: const EdgeInsets.all(25.0),
      height: 86,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kGrayLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'We take privacy issues seriously. You can be sure that your personal data is securely protected.',
              softWrap: true,
              maxLines: 3,
              style: TextStyle(fontSize: 13),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.close)
        ],
      ),
    );
  }
}

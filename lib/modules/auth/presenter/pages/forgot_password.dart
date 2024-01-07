import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/modules/auth/presenter/pages/login.dart';
import 'package:shoal_app/modules/auth/presenter/widgets/auth_wrapper.dart';
import 'package:shoal_app/shared/widgets/button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  var _email = '';

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print(_email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildForm(context),
          buildBottom(),
        ],
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppContent.strForgotText,
            textAlign: TextAlign.left,
            softWrap: true,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 80,
          ),
          TextFormField(
            decoration: inputDecoration(
              context,
              hintText: AppContent.strEnterEmail,
              imageIcon: AppImage.imgEmailIcon,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottom() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        button(
          context,
          onPressed: () {},
          child: _loading
              ? const CircularProgressIndicator()
              : Text(
                  AppContent.strForgotText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColor.kWhite),
                ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppContent.strBackTologin,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            button(
              context,
              label: AppContent.strLoginText,
              variant: Variant.text,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/modules/auth/presenter/pages/login.dart';
import 'package:shoal_app/modules/auth/presenter/widgets/auth_wrapper.dart';
import 'package:shoal_app/shared/widgets/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  Map<String, dynamic> _form = {
    "name": "",
    "email": "",
    "password": "",
    "confirmPassword": ""
  };
  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print(_form);
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

  Widget buildForm(context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppContent.strRegisterTitle,
            textAlign: TextAlign.left,
            softWrap: true,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 80,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: Theme.of(context).textTheme.bodyMedium,
            initialValue: _form['name'],
            decoration: inputDecoration(
              context,
              hintText: AppContent.strName,
              imageIcon: AppImage.imgName,
            ),
            onSaved: (value) {
              _form['name'] = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppContent.strFieldRequired;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 28.0,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: Theme.of(context).textTheme.bodyMedium,
            initialValue: _form['email'],
            decoration: inputDecoration(
              context,
              hintText: AppContent.strEnterEmail,
              imageIcon: AppImage.imgEmailIcon,
            ),
            onSaved: (value) {
              _form['email'] = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppContent.strFieldRequired;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 28.0,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            style: Theme.of(context).textTheme.bodyMedium,
            initialValue: _form['password'],
            obscureText: true,
            decoration: inputDecoration(
              context,
              hintText: AppContent.strPassword,
              imageIcon: AppImage.imgLock,
            ),
            onSaved: (value) {
              _form['password'] = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppContent.strFieldRequired;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 28.0,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            style: Theme.of(context).textTheme.bodyMedium,
            initialValue: _form['confirmPassword'],
            obscureText: true,
            decoration: inputDecoration(
              context,
              hintText: AppContent.strConfirmPassword,
              imageIcon: AppImage.imgLock,
            ),
            onSaved: (value) {
              _form['confirmPassword'] = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppContent.strFieldRequired;
              }
              return null;
            },
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
                  AppContent.strSignUpText,
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
              AppContent.strHaveAccount,
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

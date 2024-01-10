import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/core/params/params.dart';
import 'package:shoal_app/core/secrets/env.dart';
import 'package:shoal_app/modules/auth/presenter/pages/forgot_password.dart';
import 'package:shoal_app/modules/auth/presenter/pages/register.dart';
import 'package:shoal_app/modules/auth/presenter/providers/login.dart';
import 'package:shoal_app/modules/auth/presenter/widgets/auth_wrapper.dart';
import 'package:shoal_app/modules/home/presenter/pages/home.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/toaster.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _loading = false;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _auth = {"userName": "", "password": ""};

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _loading = true;
      });

      Map<String, dynamic> payload = {
        "AuthParameters": {
          "USERNAME": _auth['userName'],
          "PASSWORD": _auth['password']
        },
        "AuthFlow": Env.authFlow,
        "ClientId": Env.clientId,
      };

      // AuthPayload payload = AuthPayload(AuthParameters: {
      //   "USERNAME": _auth['userName'],
      //   "PASSWORD": _auth['password']
      // }, AuthFlow: Env.authFlow, ClientId: Env.clientId);
      // api logic
      await ref.watch(loginProvider.notifier).login(payload);

      Future.delayed(const Duration(seconds: 10), () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      loginProvider,
      (previous, next) {
        if (next.hasValue) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (build) => const HomeScreen(),
            ),
          );
        }
        if (next.hasError) {
          toaster(
            context,
            msg: next.asError!.error.toString(),
          );
        }
      },
    );

    return AuthWrapper(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildForm(context),
        buildBottom(),
      ],
    ));
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppContent.strLoginTitle,
            textAlign: TextAlign.left,
            softWrap: true,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 80,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: Theme.of(context).textTheme.bodyMedium,
            initialValue: _auth["userName"],
            decoration: inputDecoration(
              context,
              hintText: AppContent.strEnterEmail,
              imageIcon: AppImage.imgEmailIcon,
            ),
            onSaved: (value) {
              _auth["userName"] = value!;
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
            initialValue: _auth['password'],
            obscureText: true,
            decoration: inputDecoration(
              context,
              hintText: AppContent.strPassword,
              imageIcon: AppImage.imgLock,
            ),
            onSaved: (value) {
              _auth["password"] = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppContent.strFieldRequired;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CheckboxListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.all(0.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    AppContent.strRememberMe,
                    style: Theme.of(context).textTheme.displaySmall!,
                  ),
                  value: _rememberMe,
                  onChanged: (v) {
                    setState(() {
                      _rememberMe = v!;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  AppContent.strForgotText,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColor.kPrimaryColor,
                      ),
                ),
              ),
            ],
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
          onPressed: onSubmit,
          child: _loading
              ? const CircularProgressIndicator()
              : textBodyLarge(
                  context,
                  label: AppContent.strLoginText,
                  color: AppColor.kWhite,
                ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppContent.strDontHaveAccount,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            button(
              context,
              label: AppContent.strSignup,
              variant: Variant.text,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const RegisterScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}

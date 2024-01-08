import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/navbar.dart';
import 'package:shoal_app/shared/widgets/stepper.dart';
import 'package:shoal_app/shared/widgets/wrapper.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() {
    return _PersonalDetailsState();
  }
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _personalDetailForm = GlobalKey<FormState>();
  final Map<String, dynamic> _form = {
    "name": "",
    "email": "",
    "mobile": "",
    "address": "",
    "state": "",
    "city": "",
    "pincode": ""
  };
  bool _checked = false;
  void onSumit() {
    if (_personalDetailForm.currentState!.validate()) {
      _personalDetailForm.currentState!.save();
      print(_form);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Wrapper(
        child: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            stepper(context),
            textTitleMedium(
              context,
              label: AppContent.strPersonalDetails.toUpperCase(),
              color: AppColor.kBlack,
            ),
            const SizedBox(
              height: 25.0,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                    initialValue: _form["name"],
                    decoration: inputDecoration(
                      context,
                      hintText: AppContent.strName,
                      imageIcon: AppImage.imgProfile,
                    ),
                    onSaved: (value) {
                      _form["name"] = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppContent.strFieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                    initialValue: _form["email"],
                    decoration: inputDecoration(
                      context,
                      hintText: AppContent.strEnterEmail,
                      imageIcon: AppImage.imgEmailIcon,
                    ),
                    onSaved: (value) {
                      _form["email"] = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppContent.strFieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                    initialValue: _form["mobile"],
                    decoration: inputDecoration(
                      context,
                      hintText: AppContent.strMobile,
                      imageIcon: AppImage.imgMobile,
                    ),
                    onSaved: (value) {
                      _form["mobile"] = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppContent.strFieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                    initialValue: _form["address"],
                    decoration: inputDecoration(
                      context,
                      hintText: AppContent.strAddress,
                      imageIcon: AppImage.imgLocator,
                    ),
                    onSaved: (value) {
                      _form["address"] = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppContent.strFieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                    initialValue: _form["city"],
                    decoration: inputDecoration(
                      context,
                      hintText: AppContent.strCity,
                      imageIcon: AppImage.imgLocator,
                    ),
                    onSaved: (value) {
                      _form["city"] = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppContent.strFieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                    initialValue: _form["pincode"],
                    decoration: inputDecoration(
                      context,
                      hintText: AppContent.strEnterEmail,
                      imageIcon: AppImage.imgLocator,
                    ),
                    onSaved: (value) {
                      _form["pincode"] = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppContent.strFieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _checked,
                          onChanged: (value) {
                            setState(() {
                              _checked = value!;
                            });
                          }),
                      Expanded(
                        child: RichText(
                          softWrap: true,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Aggree to our',
                                style: TextStyle(
                                  color: AppColor.kGray,
                                ),
                              ),
                              const WidgetSpan(
                                  child: SizedBox(
                                width: 4,
                              )),
                              TextSpan(
                                text: 'Terms & Conditions \n',
                                style: const TextStyle(
                                    color: AppColor.kPrimaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('t 7 c');
                                  },
                              ),
                              const TextSpan(
                                text: 'and',
                                style: TextStyle(color: AppColor.kGray),
                              ),
                              const WidgetSpan(
                                  child: SizedBox(
                                width: 4,
                              )),
                              TextSpan(
                                text: 'Privacy policy',
                                style: const TextStyle(
                                    color: AppColor.kPrimaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('p 7 c');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  button(
                    context,
                    label: AppContent.strSubmit,
                    onPressed: onSumit,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0.0,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            textDisplayMedium(
              context,
              color: Colors.red,
              label: 'Last visited: ${DateTime.now()}',
            ),
          ]),
        )
      ],
    );
  }
}

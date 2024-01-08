import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/shared/widgets/button.dart';

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
    return Form(
      key: _personalDetailForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            textHedlineLarge(context, label: AppContent.strPersonalDetails),
            const SizedBox(
              height: 18.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: _form["name"],
              decoration: inputDecoration(
                context,
                hintText: AppContent.strEnterEmail,
                imageIcon: AppImage.imgEmailIcon,
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: _form["mobile"],
              decoration: inputDecoration(
                context,
                hintText: AppContent.strEnterEmail,
                imageIcon: AppImage.imgEmailIcon,
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: _form["address"],
              decoration: inputDecoration(
                context,
                hintText: AppContent.strEnterEmail,
                imageIcon: AppImage.imgEmailIcon,
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: _form["city"],
              decoration: inputDecoration(
                context,
                hintText: AppContent.strEnterEmail,
                imageIcon: AppImage.imgEmailIcon,
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: _form["pincode"],
              decoration: inputDecoration(
                context,
                hintText: AppContent.strEnterEmail,
                imageIcon: AppImage.imgEmailIcon,
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
                              fontWeight: FontWeight.bold,
                              color: AppColor.kGray),
                        ),
                        const WidgetSpan(
                            child: SizedBox(
                          width: 4,
                        )),
                        TextSpan(
                          text: 'Terms & Conditions \n',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.kPrimaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('t 7 c');
                            },
                        ),
                        const TextSpan(
                          text: 'and',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.kGray),
                        ),
                        const WidgetSpan(
                            child: SizedBox(
                          width: 4,
                        )),
                        TextSpan(
                          text: 'Privacy policy',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
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
              height: 15,
            ),
            button(context,
                label: AppContent.strSave,
                width: double.infinity,
                onPressed: onSumit)
          ],
        ),
      ),
    );
  }
}

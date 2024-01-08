import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/shared/widgets/button.dart';

class MobileVerificationForm extends StatefulWidget {
  const MobileVerificationForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MobileVerificationFormState();
  }
}

class _MobileVerificationFormState extends State<MobileVerificationForm> {
  final _text = TextEditingController(text: "");
  final _ccode = TextEditingController(text: '+91');
  String _error = '';
  void onSubmit() {
    String error = '';
    if (_text.text.isEmpty) {
      error = "Field can not be empty";
    } else if (_text.text.length < 10 && _text.text.length > 10) {
      error = "Invalid mobile no";
    }
    setState(() {
      _error = error;
    });
    print(_text.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.kTransparent,
            border: Border.all(
              color: AppColor.kBorderColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: [
              const Text(AppContent.strEnterYourPhoneNumber),
              const SizedBox(
                height: 32,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.kInputBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        controller: _ccode,
                        style: GoogleFonts.roboto(fontSize: 18),
                        decoration: const InputDecoration(
                          fillColor: AppColor.kInputBg,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        controller: _text,
                        keyboardType: TextInputType.phone,
                        style: GoogleFonts.roboto(fontSize: 18),
                        decoration: const InputDecoration(
                          hintText: 'Mobile no',
                          fillColor: AppColor.kInputBg,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        button(
          context,
          label: AppContent.strSendCode,
          width: double.infinity,
          onPressed: onSubmit,
        ),
      ],
    );
  }
}

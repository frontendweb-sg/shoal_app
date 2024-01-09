import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/shared/models/checkbox.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/checkbox.dart';

class NPSOtherDetailsScreen extends StatefulWidget {
  const NPSOtherDetailsScreen({super.key});

  @override
  State<NPSOtherDetailsScreen> createState() {
    return _NPSOtherDetailsScreenState();
  }
}

class _NPSOtherDetailsScreenState extends State<NPSOtherDetailsScreen> {

  final List<CheckBoxState> occupationDetails = [
    CheckBoxState(title: 'Private Sector'),
    CheckBoxState(title: 'Public Sector'),
    CheckBoxState(title: 'Government Sector'),
    CheckBoxState(title: 'Self Employed'),
    CheckBoxState(title: 'Homemaker'),
    CheckBoxState(title: 'Student'),
    CheckBoxState(title: 'Other')
  ];

  final List<CheckBoxState> incomeRange = [
    CheckBoxState(title: 'Upto 1 lac'),
    CheckBoxState(title: '1 lac to 5 lac'),
    CheckBoxState(title: '5 lac to 10 lac'),
    CheckBoxState(title: '10 lac to 25 lac'),
    CheckBoxState(title: '25 lac and above'),
  ];

  final List<CheckBoxState> educationalQualifications = [
    CheckBoxState(title: 'Below SSC'),
    CheckBoxState(title: 'SSC'),
    CheckBoxState(title: 'HSC'),
    CheckBoxState(title: 'Graduate'),
    CheckBoxState(title: 'Masters'),
    CheckBoxState(title: 'Professionals( CA, CS, CMA, etc.)'),
  ];

   final List<CheckBoxState> ifApplicable = [
    CheckBoxState(title: 'Politically exposed person'),
    CheckBoxState(title: 'Related to Politically exposed Person'),
  ];

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _form = {
      "occupationDetails": [],
      "incomeRange": [],
      "educationalQualifications": [],
      "ifApplicable": []
  };

  void onSumit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_form);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(child: buildForm(context)),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Column(
      children: [
        textTitleLarge(
          context,
          label: AppContent.strProfOfAddress,
          align: TextAlign.center,
          color: AppColor.kBlack,
        ),
        const SizedBox(
          height: 50.0,
        ),
        Form(
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.max,
                children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: textTitleLarge(
                          context,
                          label: AppContent.strOccupationDetails,
                          color: AppColor.kBlack
                          ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: occupationDetails
                            .map(buildEducationCheckboxList)
                            .toList(),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: textTitleLarge(
                          context,
                          label: AppContent.strIncomeRange,
                          color: AppColor.kBlack
                          ),
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: incomeRange
                            .map(buildEducationCheckboxList)
                            .toList(),
                      ),
                       const SizedBox(
                        height: 20.0,
                      ), 
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: textTitleLarge(
                          context,
                          label: AppContent.strEducationalQualifications,
                          color: AppColor.kBlack
                          ),
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: educationalQualifications
                            .map(buildEducationCheckboxList)
                            .toList(),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ), 
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: textTitleLarge(
                          context,
                          label: AppContent.strIfApplicable,
                          color: AppColor.kBlack
                          ),
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: ifApplicable
                            .map(buildEducationCheckboxList)
                            .toList(),
                      ),               
                
              const SizedBox(height: 25.0),         
              
              button(context, label: 'Submit', onPressed: onSumit),
            ],
          
      )),
      ]);
  }

  Widget buildEducationCheckboxList(CheckBoxState checkbox) {
    return checkBox(
      context,
      title: checkbox.title,
      value: checkbox.value,
      onChanged: (v) {
        setState(() {
          checkbox.value = v!;
          _form["occupationDetails"] = checkbox.title;
        });
      },
    );
  }
}

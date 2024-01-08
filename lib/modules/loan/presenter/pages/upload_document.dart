import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/modules/loan/data/models/checkbox.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/upload.dart';
import 'package:shoal_app/shared/widgets/wrapper.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({super.key});
  @override
  State<StatefulWidget> createState() {
    return _UploadDocumentState();
  }
}

class _UploadDocumentState extends State<UploadDocument> {
  final List<CheckBoxState> _educationList = [
    CheckBoxState(title: 'High school or below'),
    CheckBoxState(title: 'Undergraduate'),
    CheckBoxState(title: 'Masters Degree'),
    CheckBoxState(title: 'PhD'),
  ];
  final List<CheckBoxState> _identityList = [
    CheckBoxState(title: 'National Identity Card'),
    CheckBoxState(title: 'Driver\'s Licence'),
    CheckBoxState(title: 'International Passport'),
    CheckBoxState(title: 'Student ID'),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          textHedlineLarge(context, label: AppContent.strUploadDocument),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    textHedlineMedium(context,
                        label: AppContent.strEducationLevel),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: _educationList
                          .map(buildEducationCheckboxList)
                          .toList(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  children: [
                    textHedlineMedium(context,
                        label: AppContent.strFormIdentification),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: _identityList
                          .map(buildEducationCheckboxList)
                          .toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          textHedlineMedium(context, label: AppContent.strUploadIdentification),
          const SizedBox(
            height: 15.0,
          ),
          const Upload(),
          const SizedBox(
            height: 15.0,
          ),
          button(context, label: 'Upload', onPressed: () {}),
        ],
      ),
    );
  }

  Widget buildEducationCheckboxList(CheckBoxState checkbox) {
    return CheckboxListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      title: textBodySmall(context, label: checkbox.title),
      contentPadding: const EdgeInsets.all(0.0),
      value: checkbox.value,
      onChanged: (v) {
        setState(() {
          checkbox.value = v!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

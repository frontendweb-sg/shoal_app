import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/core/params/params.dart';
import 'package:shoal_app/modules/country/presenter/providers/country.dart';
import 'package:shoal_app/shared/providers/error.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/error.dart';

class AddCountry extends ConsumerStatefulWidget {
  const AddCountry({super.key, this.onSuccess});

  final Function()? onSuccess;

  @override
  ConsumerState<AddCountry> createState() {
    return _AddCountry();
  }
}

class _AddCountry extends ConsumerState<AddCountry> {
  final _formKey = GlobalKey<FormState>();
  final List<String> countyCodes = ['AD', 'AE', 'AG', 'USA', "INDIA"];
  String _cCode = "";
  String _name = "";
  bool _loading = false;

  _AddCountry() {
    _cCode = 'USA';
  }
  @override
  void initState() {
    super.initState();
  }

  void onAddCountry() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _loading = true;
      });

      const queryDoc = r'''
          mutation($country: CountryCreateInput!) {
            createCountry(country: $country) {
              name
              isoCode 
          }
        }
        ''';

      bool value = await ref.read(countryProvider.notifier).addCountry(
            MutationParam(
              document: queryDoc,
              variables: {
                "country": {
                  "name": _name,
                  "isoCode": _cCode,
                }
              },
            ),
          );

      setState(() {
        _loading = false;
      });
      if (value) {
        widget.onSuccess!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final error = ref.watch(errorProvider);

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (error != null) errorMessage(error.message),
            textTitleLarge(
              context,
              label: AppContent.strAddCountry,
            ),
            const SizedBox(
              height: 25.0,
            ),
            Semantics(
              value: "name",
              child: TextFormField(
                key: const Key("name"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: inputDecoration(
                  context,
                  hintText: AppContent.strName,
                  icon: Icons.place,
                ),
                initialValue: _name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppContent.strFieldRequired;
                  }
              
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Semantics(
              value: "country",
              child: DropdownButtonFormField(
                key: const Key("country"),
                decoration: inputDecoration(context, icon: Icons.place),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppContent.strFieldRequired;
                  }
                  return null;
                },
                items: countyCodes.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  _cCode = value!;
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            button(
              context,
              onPressed: onAddCountry,
              child: _loading
                  ? const CircularProgressIndicator()
                  : textBodyLarge(
                      context,
                      label: AppContent.strSave,
                      color: AppColor.kWhite,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

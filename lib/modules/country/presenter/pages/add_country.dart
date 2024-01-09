import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/decorations.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/shared/widgets/button.dart';

class AddCountry extends StatefulWidget {
  const AddCountry({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AddCountry();
  }
}

class _AddCountry extends State<AddCountry> {
  final _formKey = GlobalKey<FormState>();
  final List<String> countyCodes = ['AD', 'AE', 'AG', 'USA', "INDIA"];
  String _cCode = "";
  String _name = "";

  _AddCountry() {
    _cCode = 'USA';
  }

  void onAddCountry() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print(_name);
      print(_cCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            textTitleLarge(
              context,
              label: AppContent.strAddCountry,
            ),
            const SizedBox(
              height: 25.0,
            ),
            TextFormField(
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
            const SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
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
            const SizedBox(
              height: 20.0,
            ),
            button(
              context,
              label: AppContent.strSave,
              onPressed: onAddCountry,
            )
          ],
        ),
      ),
    );
  }
}

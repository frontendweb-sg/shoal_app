import 'package:flutter/material.dart';

Widget switchButton (
  BuildContext context, {
  required String title,
  required bool value,  
  required void Function(bool)? onChanged,
  String? key
  }
) {
    return SwitchListTile(
      key: Key("$key"),
      contentPadding: const EdgeInsets.all(0.0),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(title),
      value: value,
      onChanged: onChanged
  );
}
import 'package:flutter/material.dart';

Widget switchButton (
  BuildContext context, {
  required String title,
  required bool value,  
  required void Function(bool)? onChanged,
  }
) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.all(0.0),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(title),
      value: value,
      onChanged: onChanged
  );
}
import 'package:flutter/material.dart';

Widget dropDownList (
  BuildContext context, {
    required List<Map<String,dynamic>> items,
    required void Function(Object?) onChanged,
    required String value,
    String? defultValue,
    String? key,
  }
) {
             return InputDecorator(
                    decoration: InputDecoration(
                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(15.0)),
                    contentPadding: const EdgeInsets.all(10.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Object>(
                        key: Key("$key"),
                        isExpanded: true,
                        isDense: true,
                        menuMaxHeight: 350,
                        value: defultValue,
                        items:items.map((data) {
                          return DropdownMenuItem(
                            value: data['value'],
                            child: Text(data['title']),
                          );
                        }).toList(),
                        onChanged:onChanged                       
                      ),
                    ),
                  );
}
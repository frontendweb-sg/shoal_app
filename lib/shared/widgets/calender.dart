 import 'package:flutter/material.dart';
 import 'package:intl/intl.dart';

 Widget calendar(
  BuildContext context, {
    void Function()? onTap,
    required controller,
    String? labelText,
  }) {
      return TextField(               
                    controller: controller,                 
                    decoration: InputDecoration(                        
                        suffixIcon: const Icon(Icons.calendar_today),
                        labelText: labelText,
                        ),
                    readOnly:true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {                  
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        controller.text = formattedDate;    
                      } 
                    });
  }               
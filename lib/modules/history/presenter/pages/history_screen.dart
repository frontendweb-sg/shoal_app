import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoal_app/shared/widgets/calender.dart';
import 'package:shoal_app/shared/widgets/dropdown.dart';
import 'package:shoal_app/shared/widgets/switchbutton.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
@override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool checkBoxValue = false;
  String radioBtnValue = "male";
  String defultDropDownValue =  "Amit";
  List<Map<String, dynamic>> dropDownItems = [
    {"title": "Amit", "value": "1"},
    {"title": "Vinay", "value": "2"},
    {"title": "Pradeep", "value": "3"},
    ];

   static const List<String> _fruitOptions = <String>[ 
    'apple', 
    'banana', 
    'orange', 
    'mango', 
    'grapes', 
    'watermelon', 
    'kiwi', 
    'strawberry', 
    'sugarcane', 
  ];  

    String dropdownvalue = 'Item 1';
    var dropitems = [     
    'Item 1', 
    'Item 2', 
    'Item 3', 
    'Item 4', 
    'Item 5', 
  ];

  bool switchButtonValue = false;  

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [

            CheckboxListTile(
                key: const Key("checkbox"),
                contentPadding: const EdgeInsets.all(0.0),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Male"),
                value: checkBoxValue,
                onChanged: (value) {
                  setState(() {
                    checkBoxValue = value!;
                  });
                }),

            const SizedBox(height: 30.0),

            Row(children: [
              Expanded(
                child: RadioListTile(
                  key: const Key("radio1"),
                  contentPadding: const EdgeInsets.all(0.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Male"),
                  value: "Male",
                  groupValue: radioBtnValue,
                  onChanged: (value) {
                    setState(() {
                      radioBtnValue = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  key: const Key("radio1"),
                  contentPadding: const EdgeInsets.all(0.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: radioBtnValue,
                  onChanged: (value) {
                    setState(() {
                      radioBtnValue = value!;
                    });
                  },
                ),
              ),
            ]),

            const SizedBox(height: 30.0),

            DropdownButtonHideUnderline(
                      child: DropdownButton<Object>(
                        // key: Key("$key"),
                        isExpanded: true,
                        isDense: true,
                        menuMaxHeight: 350,
                        value: defultDropDownValue,
                        items:dropDownItems.map((data) {
                          return DropdownMenuItem(
                            value: data['value'],
                            child: Text(data['title']),
                          );
                        }).toList(),
                        onChanged:(value) {
                          setState(() {
                          defultDropDownValue = value.toString();
                          });
                        }                       
                      ),
                    ),

       
            const SizedBox(height: 30.0),

            TextField(
                    key: const Key("calender"),               
                    controller: _textEditingController,                 
                    decoration: const InputDecoration(                        
                        suffixIcon: Icon(Icons.calendar_today),
                        labelText: "DOB",
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
                         setState(() {
                          _textEditingController.text = formattedDate;
                        });                   
                      }                      
                    }),

             const SizedBox(height: 30.0),

              switchButton(
                context,
                key: "switchbutton", 
                title: "Male",
                value: switchButtonValue, 
                onChanged: (value){
                  setState(() {
                    switchButtonValue = value;
                  });
                }),

             const SizedBox(height: 30.0),   

               DropdownButton(                
                  value: dropdownvalue, 
                  icon: const Icon(Icons.keyboard_arrow_down),     
                  items: dropitems.map((String items) { 
                    return DropdownMenuItem( 
                      value: items, 
                      child: Text(items), 
                    ); 
                  }).toList(),
                    onChanged: (String? newValue) {  
                      setState(() { 
                        dropdownvalue = newValue!; 
                      }); 
                    }, 
                ), 

               const SizedBox(height: 30.0),

               const Text("enter Fruit name:"),
              Autocomplete<String>(            
                key: const Key("autocomplete"),  
                optionsBuilder: (TextEditingValue fruitTextEditingValue) { 

              if (fruitTextEditingValue.text == '') { 
                return const Iterable<String>.empty(); 
              }
              return _fruitOptions.where((String option) { 
                return option 
                    .contains(fruitTextEditingValue.text.toLowerCase()); 
              }); 
            },
            onSelected: (String value) { 
              debugPrint('You just selected $value'); 
            }, 
          ), 

                const SizedBox(height: 30.0),  



          ],
            )),
      ),
    );
  }
}

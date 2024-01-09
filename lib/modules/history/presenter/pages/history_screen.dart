import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/calender.dart';
import 'package:shoal_app/shared/widgets/dropdown.dart';
import 'package:shoal_app/shared/widgets/switchbutton.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
@override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> { 
   final _formKey = GlobalKey<FormState>();
   final Map<String, dynamic> formelements = {"Gender": false, "SelectedGender": 2, "Terms": false, "fruits": "orange", "name": "2", "itemsvalue": "Item 4"};

  void onSubmit() async {
    print(formelements);
    }

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
            child: Form(
              key: _formKey,
              child: Column(
              children: [
              CheckboxListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Male"),
                  value: formelements['Gender'],
                  onChanged: (value) {
                    setState(() {
                      formelements['Gender'] = value!;
                    });
                  }),
              
              const SizedBox(height: 30.0),
              
              Row(children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Male"),
                    value: 1,
                    groupValue: formelements['SelectedGender'],
                    onChanged: (value) {
                      setState(() {
                        formelements['SelectedGender'] = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Female"),
                    value: 2,
                    groupValue: formelements['SelectedGender'],
                    onChanged: (value) {
                      setState(() {
                        formelements['SelectedGender'] = value!;
                      });
                    },
                  ),
                ),
              ]),


              const SizedBox(height: 30.0),              
                switchButton(
                  context, 
                  title: "Terms",
                  value: formelements['Terms'], 
                  onChanged: (value){
                    setState(() {
                      formelements['Terms'] = value;
                    });
                  }),
              
              const SizedBox(height: 30.0),    
              
                    DropdownButtonHideUnderline(
                        child: DropdownButton<Object>(
                          // key: Key("$key"),
                          isExpanded: true,
                          isDense: true,
                          menuMaxHeight: 350,
                          value: formelements["name"],
                          items:dropDownItems.map((data) {
                            return DropdownMenuItem(
                              value: data['value'],
                              child: Text(data['title']),
                            );
                          }).toList(),
                          onChanged:(value) {
                            setState(() {
                            formelements["name"] = value.toString();
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
                            formelements["dob"] = formattedDate;
                          });                   
                        }                      
                      }),
              
               const SizedBox(height: 30.0),             
                       
                 DropdownButton(                
                    value: formelements['itemsvalue'], 
                    icon: const Icon(Icons.keyboard_arrow_down),     
                    items: dropitems.map((String items) { 
                      return DropdownMenuItem( 
                        value: items, 
                        child: Text(items), 
                      ); 
                    }).toList(),
                      onChanged: (newValue) {
                        setState(() { 
                          formelements['itemsvalue'] = newValue!; 
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
              fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted){
                    textEditingController.text = formelements['fruits'];// You can use the next snip of code if you dont want the initial text to come when you use setState((){});  
                    return TextFormField(                             
                  controller: textEditingController,//uses fieldViewBuilder TextEditingController
                   focusNode: focusNode,
                );
              },
              onSelected: (String value) { 
                formelements['fruits'] = value; 
              }, 
                        ), 
              
                  const SizedBox(height: 30.0),  
                button(
                      context,
                      label: "Submit",
                      onPressed: onSubmit,                    
                    ),

              
              
                        ],
              ),
            )),
      ),
    );
  }
}

import 'dart:developer';

import 'package:ayurvedic_clinic/screens/home_screen/screen_home.dart';
import 'package:ayurvedic_clinic/widgets/custom_elevated_button.dart';
import 'package:ayurvedic_clinic/widgets/custom_register_app_bar.dart';
import 'package:ayurvedic_clinic/widgets/custom_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_label_text.dart';

class ScreenRegister extends StatefulWidget {
  ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

TextEditingController _hourController = TextEditingController();
  TextEditingController _minuteController = TextEditingController();
  String? _selectedHour;
  String? _selectedMinute;
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRegisterAppBar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            const CustomLableText(
              Label: "Name",
            ),
            CustomTextInputField(
                hintText: "Enter your full name", controller: _nameController),
            KHeight20,
            const CustomLableText(
              Label: "Whatsapp Number",
            ),
            CustomTextInputField(
                hintText: "Enter your whatsapp number",
                controller: _nameController),
                 KHeight20,
            const CustomLableText(
              Label: "Address",
            ),
            CustomTextInputField(
                hintText: "Enter your full address",
                controller: _nameController),
                 KHeight20,
            const CustomLableText(
              Label: "Location",
            ),
            CustomTextInputField(
                hintText: "Choose your location",
                controller: _nameController),
                 KHeight20,
            const CustomLableText(
              Label: "Branch",
            ),
            CustomTextInputField(
                hintText: "Select the branch",
                controller: _nameController),
//add treatment 

                   KHeight20,
            const CustomLableText(
              Label: "Total Amount",
            ),
            CustomTextInputField(
                hintText: "",
                controller: _nameController),

                   KHeight20,
            const CustomLableText(
              Label: "Discount Amount",
            ),
            CustomTextInputField(
                hintText: "",
                controller: _nameController),

                //payment radio
                      KHeight20,
            const CustomLableText(
              Label: "Payment",
            ),
Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildRadioButton('Cash'),
        buildRadioButton('Card'),
        buildRadioButton('UPI'),
      ],
    ),
                   KHeight20,
            const CustomLableText(
              Label: "Advance Amount",
            ),
            CustomTextInputField(
                hintText: "",
                controller: _nameController),

                   KHeight20,
            const CustomLableText(
              Label: "Balance Amount",
            ),
            CustomTextInputField(
                hintText: "",
                controller: _nameController),

                //add treatment date and time
                    KHeight20,
            const CustomLableText(
              Label: "Treatment Date",
            ),
buildDatePickerTextField(_dateController),
                 KHeight20,
 const CustomLableText(
              Label: "Treatment Time",
            ),
                  Row(
      children: [
        Expanded(
          child: buildTextField(_hourController, 'Hour', _selectedHour,isHourField: true),
        ),
        SizedBox(width: 8),
        Expanded(
          child: buildTextField(_minuteController, 'Minute', _selectedMinute,isHourField: false),
        ),
      ],
    ),
    KHeight20,
                CustomElevatedButton(buttonText: "Save", onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ScreenHome()));
                })

          ],
        ),
      )),
    );
  }
 @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
  Widget buildRadioButton(String option) {
    return Row(
      children: [
        Radio<String>(
          value: option,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
            });
          },
          activeColor: _selectedOption == option ? Colors.green : null,
        ),
        Text(option),
      ],
    );
  }

Widget buildDatePickerTextField(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    readOnly: true,
    onTap: () {
      log("message");
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() {
                    controller.text = newDateTime.toString().substring(0, 10);
                  });
                },
              ),
            ),
          );
        },
      );
    },
    decoration: InputDecoration(
      hintText: 'Select Date',
      hintStyle: TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.grey.shade200,
      suffixIcon: Icon(Icons.calendar_today, color: Colors.green),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    ),
  );
}



Widget buildTextField(TextEditingController controller, String hintText, String? selectedValue, {required bool isHourField}) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => _showTimePicker(controller, hintText, isHourField),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        suffixIcon: Icon(Icons.arrow_drop_down),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Future<void> _showTimePicker(TextEditingController controller, String hintText, bool isHourField) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isHourField ? TimeOfDay(hour: TimeOfDay.now().hour, minute: 0) : TimeOfDay.now(),
      initialEntryMode: isHourField ? TimePickerEntryMode.input : TimePickerEntryMode.dial,
    );
    if (pickedTime != null) {
      if (isHourField) {
        controller.text = pickedTime.hour.toString();
        _selectedHour = pickedTime.hour.toString();
      } else {
        controller.text = pickedTime.minute.toString();
        _selectedMinute = pickedTime.minute.toString();
      }
      setState(() {});
    }
  }

}

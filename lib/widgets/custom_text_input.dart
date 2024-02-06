import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
 
final bool isPassword;
  CustomTextInputField({
    super.key,
    required this.hintText,
    required this.controller, 
   
     this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
       
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
          enabledBorder: OutlineInputBorder(
              borderSide:const  BorderSide(
                color: Colors.grey,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: KLightGreyColor),
          
    );
  }
}
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
   final VoidCallback onPressed;
   CustomElevatedButton({
    super.key, required this.buttonText, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: KGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              8.0), 
        ),
      ),
      child:Container(
        height: 50,
        width: double.infinity,
        child: Center(
          child:  Text(
            buttonText,
            style:const TextStyle(
              color: KWhiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
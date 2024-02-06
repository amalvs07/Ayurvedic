import 'package:ayurvedic_clinic/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRegisterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 10,
              right: 30,
            ),
            child: AppBar(
              backgroundColor: KWhiteColor,
              elevation: 0,
              actions: [
                GestureDetector(
                    onTap: () {
                      
                    },
                    child: Image.asset("assets/images/notify.png")),
              ],
            ),
          ),
          KHeight10,
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              'Register',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          KHeight10,
          const Divider()
        ]);
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 100.0); // Adjust the height as needed
}

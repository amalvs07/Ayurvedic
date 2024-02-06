import 'package:ayurvedic_clinic/screens/register_screen/screen_register.dart';
import 'package:ayurvedic_clinic/widgets/custom_card_view.dart';
import 'package:ayurvedic_clinic/widgets/custom_elevated_button.dart';
import 'package:ayurvedic_clinic/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_home_app_bar.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(controller: _searchcontroller),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index==9) {
                return Column(
                children: [
                  CustomCardView(),
                  SizedBox(height: 100),

                ],
              );
              }else{
              return Column(
                children: [
                  CustomCardView(),
                  SizedBox(height: 10),
                ],
              );
              }
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: CustomElevatedButton(
              buttonText: "Register",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenRegister()),
                );
              })),
    );
  }
}

import 'package:ayurvedic_clinic/constants/constants.dart';
import 'package:ayurvedic_clinic/screens/home_screen/screen_home.dart';
import 'package:ayurvedic_clinic/widgets/custom_label_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_input.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/background_2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/logo_1.png",
                width: 80,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Login Or Register To Book Your Appointments",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomLableText(
                      Label: "Email",
                    ),
                    CustomTextInputField(
                        hintText: "Enter your email",
                        controller: _emailController),
                    KHeight20,
                  const  CustomLableText(
                      Label: "Password",
                    ),
                    CustomTextInputField(
                        hintText: "Enter your Password",
                        controller: _passwordController,
                        isPassword: true,),
                        
                    const SizedBox(
                      height: 40,
                    ),
                    CustomElevatedButton(
                      buttonText: "Login",
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => ScreenHome()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

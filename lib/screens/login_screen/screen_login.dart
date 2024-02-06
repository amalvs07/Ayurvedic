import 'dart:convert';

import 'package:ayurvedic_clinic/constants/constants.dart';
import 'package:ayurvedic_clinic/screens/home_screen/screen_home.dart';
import 'package:ayurvedic_clinic/widgets/custom_label_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_input.dart';
import 'package:http/http.dart' as http;

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  String _token = '';

  Future<void> _login() async {
    final url = Uri.parse('http://flutter-amr.noviindus.in/api/Login');
    final response = await http.post(
      url,
      body: {
        'username': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      if (token != null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
              child: CircularProgressIndicator(
            strokeAlign: 2,
          )),
        );

    
        await Future.delayed(Duration(seconds: 2));

       
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenHome()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Incorrect Username or password',style: TextStyle(fontSize: 20),),
            content: Text(
                ' Please enter correct username and password'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
      setState(() {
        _token = token;
      });
    } else {
      // Handle error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Login failed. Please check your credentials.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
                    const CustomLableText(
                      Label: "Password",
                    ),
                    CustomTextInputField(
                      hintText: "Enter your Password",
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomElevatedButton(
                      buttonText: "Login",
                      onPressed: _login,
                    ),
                  const  SizedBox(
                      height: 60,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text:const TextSpan(
                        text:
                            'By creating or logging into an account you are agreeing with our ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),

                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),

                          ),
                        ],
                      ),
                    )
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

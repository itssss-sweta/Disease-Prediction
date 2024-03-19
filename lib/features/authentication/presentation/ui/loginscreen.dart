import 'dart:convert';
import 'dart:developer';
import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/authentication_screens_border_layout.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/textfields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Login Screen to enter email and password for authentication
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  // final TextEditingController number = TextEditingController();

  Future<void> loginUser() async{
    final String username = name.text;
    final String pw = password.text;

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/login/'),
      body : jsonEncode({
        'username' : username,
        'password' : pw,
      }),
      headers: {'Content-Type' : 'application/json'},
    );
    if(response.statusCode == 200){
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignBorderLayout(
      title: 'Login',
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/dna.png',
            height: 70,
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight5,
          Text(
            'PredictWell',
            style: TextStyleCustomized.semibold16teal,
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight35,
          TextContainer(
            controller: name,
            hintText: 'Enter your username',
            icon: Icons.person,
            suffix: false,
            type: TextInputType.name,
          ),
          TextContainer(
            controller: password,
            hintText: 'Enter your password',
            icon: Icons.lock_outlined,
            suffix: true,
            type: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight15,
          Center(
            child: Button(
              text: 'Login',
              color: ColorPalate.teal,
              textStyle: TextStyleCustomized.semibold16white,
              onTap: () {
                loginUser();
              },
            ),
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight15,
          richTextToSwitchScreen(context)
        ],
      ),
    );
  }

  Center richTextToSwitchScreen(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an Account?',
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: ' Sign Up',
              style: TextStyleCustomized.medium15teal,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('text tapped');
                  Navigator.pushNamed(context, Routes.signupScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}

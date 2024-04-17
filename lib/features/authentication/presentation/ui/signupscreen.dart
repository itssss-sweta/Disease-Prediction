import 'dart:convert';
import 'dart:developer';
import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/authentication_screens_border_layout.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/textfields.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

/// Screen to sign up for the application
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<bool> signUpUser() async {
    final String emailInput = email.text;
    final String username = name.text;
    final String pw = password.text;

    final response = await http.post(
        Uri.parse('https://eye-disease-prediction-xf00.onrender.com/api/signup/'),
        body: jsonEncode(
            {'email': emailInput, 'username': username, 'password': pw}),
        headers: {'Content-Type': 'application/json'});

    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignBorderLayout(
      title: 'Sign Up',
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
            hintText: 'Enter your name',
            icon: Icons.person,
            suffix: false,
            type: TextInputType.name,
          ),
          TextContainer(
            controller: email,
            hintText: 'Enter your email',
            icon: Icons.email_outlined,
            suffix: false,
            type: TextInputType.emailAddress,
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
              text: 'Sign Up',
              color: ColorPalate.teal,
              textStyle: TextStyleCustomized.semibold16white,
              onTap: () async {
                bool isUserAuthenticated = await signUpUser();
                if (isUserAuthenticated && context.mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.loginScreen, (route) => false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

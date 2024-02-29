import 'dart:developer';

import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:flutter/material.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dna.png',
              height: 60,
            ),
            sHeight,
            Text(
              'Let\'s Get Started!',
              style: bold22,
            ),
            xsHeight,
            Text(
              //src:chatgpt
              'Secure login, health insights begin. Your wellness journey, our prediction.',
              softWrap: true,
              style: regular16,
              textAlign: TextAlign.center,
            ),
            mHeight,
            Button(
                text: 'Login',
                color: teal,
                textStyle: semibold16w,
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                  log('pressed');
                }),
            sHeight,
            Button(
                text: 'Register',
                color: white,
                textStyle: semibold16t,
                onTap: () {
                  Navigator.pushNamed(context, Routes.signupScreen);
                  log('pressed');
                }),
          ],
        ),
      ),
    );
  }
}

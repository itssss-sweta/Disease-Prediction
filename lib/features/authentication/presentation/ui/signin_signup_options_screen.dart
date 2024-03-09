import 'dart:developer';
import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:flutter/material.dart';

/// Screen having options(buttons) to navigate to sign up or sign in
class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dna.png',
              height: 60,
            ),
            SizedBoxHeightAndWidth.sizedBoxHeight15,
            Text(
              'Let\'s Get Started!',
              style: TextStyleCustomized.bold22black,
            ),
            SizedBoxHeightAndWidth.sizedBoxHeight5,
            Text(
              'Secure login, health insights begin. Your wellness journey, our prediction.',
              softWrap: true,
              style: TextStyleCustomized.regular16black,
              textAlign: TextAlign.center,
            ),
            SizedBoxHeightAndWidth.sizedBoxHeight20,
            Button(
                text: 'Login',
                color: ColorPalate.teal,
                textStyle: TextStyleCustomized.semibold16white,
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                  log('pressed');
                }),
            SizedBoxHeightAndWidth.sizedBoxHeight15,
            Button(
                text: 'Register',
                color: ColorPalate.white,
                textStyle: TextStyleCustomized.semibold16teal,
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

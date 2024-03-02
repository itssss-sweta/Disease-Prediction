import 'dart:async';
import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:flutter/material.dart';

/// Splash screen having a logo
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay for the splash screen duration
    Timer(
      const Duration(seconds: 3), // Set the duration of the splash screen
      () {
        Navigator.pushReplacementNamed(context, Routes.signScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.white, // Set your background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dna.gif',
              width: 150,
              height: 150,
            ),
            SizedBoxHeightAndWidth.sizedBoxHeight15,
            Text(
              //ref:chatgpt
              'PredictWell',
              style: TextStyleCustomized.medium30grey,
            ),
          ],
        ),
      ),
    );
  }
}

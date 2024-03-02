import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/padding.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:flutter/material.dart';

class SignBorder extends StatelessWidget {
  final Widget? widget;
  final String? title;
  const SignBorder({super.key, this.widget, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: teal,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          title ?? '',
          style: bold20w,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: teal,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.signScreen);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: equalmaxpadding,
            padding: equalmaxpadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: white,
            ),
            child: Center(
              child: widget,
            ),
          ),
        ),
      ),
    );
  }
}

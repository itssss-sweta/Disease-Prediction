import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/padding.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? onTap;
  final TextStyle? textStyle;
  const Button(
      {super.key, required this.text, this.color, this.onTap, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: 55,
        width: MediaQuery.sizeOf(context).width / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: grey,
              offset: const Offset(0, 0.2),
            ),
          ],
        ),
        child: Center(
            child: Text(
          text ?? '',
          style: textStyle,
        )),
      ),
    );
  }
}

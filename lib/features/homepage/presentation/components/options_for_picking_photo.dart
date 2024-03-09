import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:flutter/material.dart';

/// Options inside modal bottom sheet for picking image
class OptionsForPickingPhoto extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final VoidCallback onPress;
  const OptionsForPickingPhoto(
      {super.key, this.icon, this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPress,
          icon: Icon(
            icon,
            size: 40,
            color: ColorPalate.teal,
          ),
        ),
        Text(
          text ?? '',
          style: TextStyleCustomized.regular16black,
        ),
      ],
    );
  }
}

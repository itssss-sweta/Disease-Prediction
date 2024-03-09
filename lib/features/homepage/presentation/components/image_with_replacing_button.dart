import 'dart:developer';
import 'dart:io';
import 'package:dis_pred/core/constants/padding.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:flutter/material.dart';

/// Selected Image with Replace button on center
Stack imageWithReplacingButton(
    {File? imagePath, required dynamic setImagePath}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.file(
        imagePath ?? File(''),
      ),
      // Button to replace image displayed over a selected image
      GestureDetector(
        onTap: () {
          log('pressed');
          setImagePath();
        },
        child: Container(
          padding: MarginOrPadding.equalpadding,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Replace',
            style: TextStyleCustomized.semibold16white,
          ),
        ),
      ),
    ],
  );
}

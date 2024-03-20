import 'dart:io';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/domain/login_view_model.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:dis_pred/features/homepage/presentation/components/image_with_replacing_button.dart';
import 'package:dis_pred/features/homepage/presentation/components/photo_picker_modal_bottom_sheet.dart';
import 'package:dis_pred/features/result/presentation/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

/// HomePage consisting a photo selector
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;

  /// Sets the chosen image when a photo is picked by the user.
  _setImageValue(XFile? pickedImage) {
    // Prompt the user to choose a photo and await the result.
    if (pickedImage != null) {
      setState(() {
        // Convert the XFile to a File object and assign it to _image of type File
        _image = File(pickedImage.path);
      });
    }
  }

  // Opens bottom model of options for picking image and picked image is returned
  Future<XFile?> _pickImage() async {
    XFile? pickedImage = await ImagePickerService().photoChooseOption(context);
    return pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    /// TODO: access token this way
    String token = context.read<LoginViewModel>().token ?? '';

    return Scaffold(
      backgroundColor: ColorPalate.dimWhite,
      appBar: AppBar(
        title: Text(
          'PredictWell',
          style: TextStyleCustomized.bold20white,
        ),
        backgroundColor: ColorPalate.teal,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () async {
              XFile? pickedImage = await _pickImage();
              _setImageValue(pickedImage);
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height / 3,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorPalate.grey,
                  width: 1,
                ),
              ),
              child: (_image == null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                          color: ColorPalate.teal,
                        ),
                        SizedBoxHeightAndWidth.sizedBoxHeight5,
                        const Text('Choose an image'),
                      ],
                    )
                  : imageWithReplacingButton(
                      imagePath: _image,
                      setImagePath: () async {
                        XFile? pickedImage = await _pickImage();
                        _setImageValue(pickedImage);
                      },
                    ),
            ),
          ),
          Button(
            text: 'Predict',
            color: ColorPalate.teal,
            textStyle: TextStyleCustomized.semibold16white,
            onTap: () {
              _navigateToResultScreen();
            },
          )
        ],
      ),
    );
  }

  _navigateToResultScreen() {
    ResultScreen.presentScreen(context);
  }
}

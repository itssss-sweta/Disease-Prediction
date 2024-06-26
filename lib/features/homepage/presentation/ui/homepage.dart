import 'dart:io';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:dis_pred/features/homepage/domain/home_view_model.dart';
import 'package:dis_pred/features/homepage/presentation/components/alert_dialog_widget.dart';
import 'package:dis_pred/features/homepage/presentation/components/image_with_replacing_button.dart';
import 'package:dis_pred/features/homepage/presentation/components/photo_picker_modal_bottom_sheet.dart';
import 'package:dis_pred/features/homepage/presentation/ui/result_screen.dart';
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
  /// Sets the chosen image when a photo is picked by the user.
  _setImageValue(XFile? pickedImage) {
    if (pickedImage != null) {
      setState(() {
        context.read<HomeViewModel>().image = File(pickedImage.path);
      });
    }
  }

  /// Opens bottom model of options for picking image and picked image is returned
  Future<XFile?> _pickImage() async {
    XFile? pickedImage = await ImagePickerService().photoChooseOption(context);
    return pickedImage;
  }

  Future<void> _uploadImage(BuildContext context) async {
    if (context.read<HomeViewModel>().image == null) {
      return;
    }
    context.read<HomeViewModel>().setButtonEnable(false);
    final predictResponse = await context.read<HomeViewModel>().uploadImage();
    if (predictResponse.errorMessage == null) {
      if (context.mounted) {
        context.read<HomeViewModel>().setButtonEnable(true);
        ResultScreen.presentScreen(context);
      }
    } else {
      if (!context.mounted) return;
      context.read<HomeViewModel>().setButtonEnable(true);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          predictResponse.errorMessage ?? '',
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.dimWhite,
      appBar: AppBar(
        title: Text(
          'PredictWell',
          style: TextStyleCustomized.bold20white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: const Icon(Icons.logout_outlined))
        ],
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
              child: (context.read<HomeViewModel>().image == null)
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
                      imagePath: context.read<HomeViewModel>().image,
                      setImagePath: () async {
                        XFile? pickedImage = await _pickImage();
                        _setImageValue(pickedImage);
                      },
                    ),
            ),
          ),
          Button(
            text: 'Predict',
            color: (context.watch<HomeViewModel>().image == null ||
                    !context.watch<HomeViewModel>().isButtonEnabled)
                ? ColorPalate.lightGrey
                : ColorPalate.teal,
            textStyle: TextStyleCustomized.semibold16white,
            onTap: (context.watch<HomeViewModel>().image == null ||
                    !context.watch<HomeViewModel>().isButtonEnabled)
                ? null
                : () {
                    _uploadImage(context);
                  },
          )
        ],
      ),
    );
  }
}

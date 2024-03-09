import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/image_wrapper.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/homepage/presentation/components/options_for_picking_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final picker = ImagePicker();
  XFile? pickedFile;

  /// Pop up bottom sheet providing options of picking images from camera or gallery
  Future<XFile?> photoChooseOption(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: ColorPalate.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height / 4.5,
      ),
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Upload Eye Image',
              style: TextStyleCustomized.bold18black,
            ),
            // Custom widget for displaying and performing action on the icons(options)
            Center(
              child: OptionsForPickingPhoto(
                onPress: () async {
                  pickedFile =
                      await ImagePickerWrapper.pickImage(ImageSource.gallery);
                  if (context.mounted) {
                    // Pop up with a XFile selected from camera
                    Navigator.of(context).pop(pickedFile);
                  }
                },
                icon: Icons.camera_alt_outlined,
                text: 'Gallery',
              ),
            )
          ],
        );
      },
    );
    if (pickedFile != null) {
      return pickedFile;
    } else {
      return null;
    }
  }
}

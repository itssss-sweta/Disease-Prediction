import 'dart:developer';
import 'package:image_picker/image_picker.dart';

/// Wrapper for an image picker package
class ImagePickerWrapper {
  static final _picker = ImagePicker();

  /// Static method to pick an image from a specified source.
  /// Returns null if an error occurs during image picking.
  static Future<XFile?> pickImage(ImageSource source) async {
    try {
      XFile? image = await _picker.pickImage(source: source);
      return image;
    } catch (e) {
      log("Error picking image: $e");
      return null;
    }
  }
}

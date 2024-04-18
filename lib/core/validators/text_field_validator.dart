import 'package:dis_pred/core/extension/regex.dart';

class TextFieldValidator {
  /// Validates whether the field is empty or not.
  static String? validateEmptyField(String? value) {
    if (value?.isNullOrEmpty == true) {
      return 'Required Field';
    } else {
      return null;
    }
  }

  /// Validates the Password field and returns null if validation is successful;
  /// otherwise, returns a string error message.
  static String? validatePasswordField(String? value) {
    if (value?.isNullOrEmpty == true) {
      return 'Required Field';
    } else if (!value!.isLowerCaseOnly) {
      return ' Atleast one lower case is required';
    } else if (!value.isNumberOnly) {
      return ' Atleast one number is required';
    } else if (!value.isSpecialCharactersOnly) {
      return ' Atleast one special characters is required';
    } else if (value.length < 8) {
      return 'Required length is 8';
    } else {
      return null;
    }
  }

  /// Validates the Email field and returns null if validation is successful;
  /// otherwise, returns a string error message.
  static String? validateEmailField(String? value) {
    if (value?.isNullOrEmpty == true) {
      return 'Required Field';
    } else if (!value!.isEmailValid) {
      return 'Wrong Email Format';
    } else {
      return null;
    }
  }

  /// Validates name field and return null if validation is successful;
  /// otherwise, return specific message.
  static String? validateNameField(String? value) {
    if (value?.isNullOrEmpty == true) {
      return 'Required Field';
    } else if (!value!.isNameValid) {
      return "Only String is allowed";
    } else {
      return null;
    }
  }
}

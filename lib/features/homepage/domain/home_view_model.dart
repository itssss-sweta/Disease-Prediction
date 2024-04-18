import 'dart:io';

import 'package:dis_pred/features/homepage/data/models/prediction_response_model.dart';
import 'package:dis_pred/features/homepage/data/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  File? image;
  PredictionResponseModel? predictionResponseModel;

  Future<({PredictionResponseModel? responseModel, String? errorMessage})>
      uploadImage() async {
    ({
      String? error,
      PredictionResponseModel? predictionResponseModel
    }) response = await HomeRepository.predictDisease(image: image ?? File(''));

    if (response.error == null) {
      predictionResponseModel = response.predictionResponseModel;
      return (responseModel: predictionResponseModel, errorMessage: null);
    } else {
      return (responseModel: null, errorMessage: response.error);
    }
  }

  bool isButtonEnabled = true;

  setButtonEnable(bool value) {
    isButtonEnabled = value;
    notifyListeners();
  }
}

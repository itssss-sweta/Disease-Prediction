import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dis_pred/core/cache/cache_services.dart';
import 'package:dis_pred/features/homepage/data/models/prediction_response_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  static Future<
          ({PredictionResponseModel? predictionResponseModel, String? error})>
      predictDisease({required File image}) async {
    PredictionResponseModel predictionResponseModel;

    final url = Uri.parse(
        "https://eye-disease-prediction-xf00.onrender.com/api/eyepredict/");
    final request = http.MultipartRequest('POST', url);

    List<int> imageBytes = await image.readAsBytes();

    request.files.add(
      http.MultipartFile.fromBytes('image', imageBytes,
          filename: image.path.split('/').last),
    );
    request.headers['Authorization'] =
        'Token ${CacheServices.getCacheServicesInstance.getToken}';
    try {
      final response = await request.send();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseBody = await response.stream.bytesToString();
        final decodedBody = jsonDecode(responseBody);
        predictionResponseModel = PredictionResponseModel.fromJson(decodedBody);
        return (predictionResponseModel: predictionResponseModel, error: null);
      }
    } catch (e) {
      log("error $e");
      return (predictionResponseModel: null, error: e.toString());
    }
    return (
      predictionResponseModel: null,
      error: 'An unexpected error occured!'
    );
  }
}

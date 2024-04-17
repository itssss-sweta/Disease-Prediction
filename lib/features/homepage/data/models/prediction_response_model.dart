class PredictionResponseModel {
  Result? result;
  String? image;

  PredictionResponseModel({this.result, this.image});

  PredictionResponseModel.fromJson(Map<String, dynamic> json) {
    result = json["result"] == null ? null : Result.fromJson(json["result"]);
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data["result"] = result?.toJson();
    }
    data["image"] = image;
    return data;
  }
}

class Result {
  String? predictions;
  String? descriptions;
  List<String>? causes;
  List<String>? symptoms;
  String? treatment;

  Result(
      {this.predictions,
      this.descriptions,
      this.causes,
      this.symptoms,
      this.treatment});

  Result.fromJson(Map<String, dynamic> json) {
    predictions = json["Predictions"];
    descriptions = json["Descriptions"];
    causes = json["Causes"] == null ? null : List<String>.from(json["Causes"]);
    symptoms =
        json["Symptoms"] == null ? null : List<String>.from(json["Symptoms"]);
    treatment = json["Treatment"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Predictions"] = predictions;
    data["Descriptions"] = descriptions;
    if (causes != null) {
      data["Causes"] = causes;
    }
    if (symptoms != null) {
      data["Symptoms"] = symptoms;
    }
    data["Treatment"] = treatment;
    return data;
  }
}

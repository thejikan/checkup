import 'dart:convert';
import 'package:checkup/models/testDataConfig.dart';

class DetailsModel {
  List<TestDataConfig> testData;

  DetailsModel({
    this.testData = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'testData': testData,
    };
  }

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
      testData: map['testData'] as List<TestDataConfig>,
    );
  }

  factory DetailsModel.empty() {
    return DetailsModel(
      testData: [],
    );
  }

  factory DetailsModel.fromQueryMap(Map<String, dynamic> map) {
    return DetailsModel(
      testData: map['testData'] as List<TestDataConfig>? ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsModel.fromJson(String source) =>
      DetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

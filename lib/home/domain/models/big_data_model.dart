import 'package:flutter_crypto_app/home/domain/models/data_model.dart';
import 'package:flutter_crypto_app/home/domain/models/status_model.dart';

class BigDataModel {
  final StatusModel statusModel;
  final List<DataModel> dataModel;

  BigDataModel({
    required this.statusModel,
    required this.dataModel,
  });
  factory BigDataModel.fromJson(Map<String, dynamic> json) {
    var dataList = json["data"] as List;
    List<DataModel> dataModelList = dataList.map((e) => DataModel.fromJson(e)).toList();
    return BigDataModel(statusModel: StatusModel.fromJson(json["status"]), dataModel: dataModelList);
  }
  BigDataModel.withError(String error)
      : statusModel = StatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
}

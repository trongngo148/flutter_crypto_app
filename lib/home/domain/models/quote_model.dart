import 'package:flutter_crypto_app/home/domain/models/usd_model.dart';

class QuoteModel {
  final UsdModel usdModel;

  QuoteModel({required this.usdModel});
  factory QuoteModel.formJson(Map<String, dynamic> json) {
    return QuoteModel(usdModel: UsdModel.fromJson(json["USD"]));
  }
}

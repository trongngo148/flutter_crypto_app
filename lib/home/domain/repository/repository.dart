import 'package:dio/dio.dart';
import 'package:flutter_crypto_app/home/domain/models/models.dart';

class Repository {
  static String mainUrl = 'https://pro-api.coinmarketcap.com/v1/';
  final String apiKey = 'b064f8d7-9117-4438-8689-76742b0160ae';
  var currentListingAPI = '${mainUrl}cryptocurrency/listings/latest';
  final Dio _dio = Dio();
  Future<BigDataModel> getCoins(int indexLoop, int maxItems) async {
    final int startItem = indexLoop * maxItems + 1;
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      _dio.options.queryParameters = {"start": startItem, "limit": maxItems};
      Response response = await _dio.get(currentListingAPI);
      return BigDataModel.fromJson(response.data);
    } catch (error, stackTrace) {
      print("exception $error, dd $stackTrace");
      return BigDataModel.withError("eerroor");
    }
  }
}

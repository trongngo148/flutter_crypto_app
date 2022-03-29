import 'package:flutter_crypto_app/home/domain/models/quote_model.dart';

class DataModel {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int numMarketPairs;
  final String dateAdded;
  final List<dynamic> tags;
  final num maxSupply;
  final num circulatingSupply;
  final num totalSupply;
  final int cmcRank;
  final String lastUpdated;
  final QuoteModel quoteModel;

  DataModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.cmcRank,
    required this.lastUpdated,
    required this.quoteModel,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: json["date_added"],
        tags: json["tags"],
        maxSupply: json["max_supply"] ?? 0,
        circulatingSupply: json["circulating_supply"],
        totalSupply: json["total_supply"],
        cmcRank: json["cmc_rank"],
        lastUpdated: json["last_updated"],
        quoteModel: QuoteModel.formJson(json["quote"]));
  }
}

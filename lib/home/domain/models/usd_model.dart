class UsdModel {
  final num price;
  final num volume24h;
  final num volumeChange24h;
  final num percentChange1h;
  final num percentChange24h;
  final num percentChange7d;
  final num percentChange30d;
  final num percentChange60d;
  final num percentChange90d;
  final num marketCap;
  final num marketCapDominance;
  final num fullyDilutedMarketCap;
  final String lastUpdated;

  UsdModel({
    required this.price,
    required this.volume24h,
    required this.volumeChange24h,
    required this.percentChange1h,
    required this.percentChange24h,
    required this.percentChange7d,
    required this.percentChange30d,
    required this.percentChange60d,
    required this.percentChange90d,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.lastUpdated,
  });
  factory UsdModel.fromJson(Map<String, dynamic> json) {
    return UsdModel(
      price: json["price"],
      volume24h: json["volume_24h"] ?? 0,
      volumeChange24h: json["volume_change_24h"],
      percentChange1h: json["percent_change_1h"],
      percentChange24h: json["percent_change_24h"],
      percentChange7d: json["percent_change_7d"],
      percentChange30d: json["percent_change_30d"],
      percentChange60d: json["percent_change_60d"],
      percentChange90d: json["percent_change_90d"],
      marketCap: json["market_cap"],
      marketCapDominance: json["market_cap_dominance"],
      fullyDilutedMarketCap: json["fully_diluted_market_cap"],
      lastUpdated: json["last_updated"],
    );
  }
}

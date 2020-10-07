import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Portfolio {
  int id;
  String name;
  List<PortfolioData> data;
  @JsonKey(nullable: true)
  double total;
  String baseCurrency = "";
  Map<AssetType, double> assetDistribution = {};

  Portfolio({this.data, this.total, this.baseCurrency, this.assetDistribution});
}

enum AssetType { CRYPTO, CURRENCY, STOCK }

extension ParseToString on AssetType {
  String toShortString() {
    return toBeginningOfSentenceCase(
        this.toString().split('.').last.toLowerCase());
  }
}

@JsonSerializable(nullable: false)
class PortfolioData {
  int id;
  int portfolioId;
  String code = "";

  @JsonKey(nullable: true)
  double unitPrice = 0;
  @JsonKey(nullable: true)
  double amount = 0;
  @JsonKey(nullable: true)
  double value = 0;
  @JsonKey(nullable: true)
  double weight = 0;
  String label = "";
  AssetType type;

  PortfolioData(
      {this.code,
      this.amount,
      this.type,
      this.value,
      this.weight,
      this.unitPrice,
      this.label});

  @override
  String toString() {
    return 'PortfolioData{code: $code, amount: $amount, unitPrice: $unitPrice, type: $type}';
  }
}

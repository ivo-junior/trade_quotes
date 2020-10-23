import 'package:flutter/material.dart';
import 'dart:math' as Math;

const int kColorMin = 127;

class Ativo implements Comparable<Ativo> {
  String symbol;
  String companyName;
  String primaryExchange;
  dynamic change;
  dynamic changePercent;
  dynamic peRatio;
  dynamic price;
  dynamic delayedPrice;
  dynamic avgTotalVolume;
  dynamic open;
  dynamic close;
  String latestTime;
  dynamic high;
  dynamic low;
  String currency;

  final Color kColora = Color.fromRGBO(
      kColorMin + Math.Random().nextInt(255 - kColorMin),
      kColorMin + Math.Random().nextInt(255 - kColorMin),
      kColorMin + Math.Random().nextInt(255 - kColorMin),
      1.0);
  final Color kColorb = Color.fromRGBO(
      kColorMin + Math.Random().nextInt(255 - kColorMin),
      kColorMin + Math.Random().nextInt(255 - kColorMin),
      kColorMin + Math.Random().nextInt(255 - kColorMin),
      1.0);

  Ativo.fromJson(Map quoteJsonData)
      : symbol = quoteJsonData['symbol'],
        companyName = quoteJsonData['companyName'],
        price = quoteJsonData['price'],
        delayedPrice = quoteJsonData['delayedPrice'],
        primaryExchange = quoteJsonData['primaryExchange'],
        peRatio = quoteJsonData['peRatio'],
        latestTime = quoteJsonData['latestTime'],
        change = quoteJsonData['change'],
        changePercent = quoteJsonData['changePercent'],
        avgTotalVolume = quoteJsonData['avgTotalVolume'],
        open = quoteJsonData['open'],
        close = quoteJsonData['close'],
        high = quoteJsonData['high'],
        low = quoteJsonData['low'],
        currency = quoteJsonData['currency'];

  Ativo() {}

  @override
  int compareTo(Ativo other) {
    // TODO: implement compareTo
    return this.symbol.compareTo(other.symbol);
  }
}

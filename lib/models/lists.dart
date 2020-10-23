import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:trade_quotes/models/ativo.dart' as Ativo;

const int kColorMin = 127;

enum MarketListType { GAINERS, LOSERS, STOCKS, CRIPTO }

class MarketList {
  final MarketListType _marketListType;
  final Ativo.Ativo _quote;
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

  MarketList(this._marketListType, this._quote);

  MarketList.fromJson(Map marketListJson, MarketListType marketListType)
      : _marketListType = marketListType,
        _quote = Ativo.Ativo.fromJson(marketListJson);
  get quote => this._quote;
  get marketListType => this._marketListType;
}

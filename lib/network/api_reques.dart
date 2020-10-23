import 'dart:async';
import 'dart:convert' as Convert;
import 'dart:io';
import 'package:finance_quote/finance_quote.dart';
import 'package:http/http.dart' as Http;

import 'package:trade_quotes/models/lists.dart' as MarketLists;
import 'package:trade_quotes/models/ativo.dart';
import 'package:trade_quotes/models/charts.dart' as Charts;

class ApiReques {
  static ApiReques _sIexApiProxyInstance;
  final Http.Client httpClient = Http.Client();

  ApiReques() {
    print('Instantiating instance!!');
  }

  static getInstance() {
    if (_sIexApiProxyInstance == null) {
      _sIexApiProxyInstance = ApiReques();
    }
    return _sIexApiProxyInstance;
  }

  Future<List<MarketLists.MarketList>> fetchAList(
      MarketLists.MarketListType marketListType) async {
    List<MarketLists.MarketList> list = [];
    switch (marketListType) {
      case MarketLists.MarketListType.GAINERS:
        break;
      case MarketLists.MarketListType.LOSERS:
        break;
      case MarketLists.MarketListType.STOCKS:
        break;
      case MarketLists.MarketListType.CRIPTO:
        break;
    }

    return list;
  }

  Future<Charts.ChartModel> fetchChartData(
      String symbol, Charts.ChartDurations duration,
      [int interval]) async {
    Charts.ChartModel chartModel;
    // await httpClient
    //     .get(Uri.parse(
    //         '$_sEndpointStable${Charts.ChartModel.constructEndpoint(symbol, duration, interval)}${
    //         interval != null ? '&' : '?'
    //         }$_sToken')

    // )
    //     .then((response){
    //   return response.body;
    // })
    //     .then(Convert.json.decode)
    //     .then((chartData) {
    //   chartModel = Charts.ChartModel(symbol, duration, interval, chartData);
    // });

    return chartModel;
  }

  dispose() {
    _sIexApiProxyInstance = null;
  }

  Future<Ativo> fetchSingleAtivo(String symbol) async {
    Ativo ativo;

    final Map<String, Map<String, dynamic>> quotePrice =
        await FinanceQuote.getRawData(
            quoteProvider: QuoteProvider.yahoo, symbols: <String>[symbol]);
    ativo = Ativo();
    ativo.symbol = symbol;

    ativo.open = quotePrice[symbol]['regularMarketOpen'].toString();
    ativo.low = quotePrice[symbol]['regularMarketDayLow'].toString();
    ativo.high = quotePrice[symbol]['regularMarketDayHigh'].toString();
    ativo.price = quotePrice[symbol]['regularMarketPrice'].toString();
    ativo.change = quotePrice[symbol]['regularMarketChange'].toString();
    ativo.changePercent =
        quotePrice[symbol]['regularMarketChangePercent'].toString();
    ativo.avgTotalVolume = quotePrice[symbol]['regularMarketVolume'].toString();
    ativo.companyName = quotePrice[symbol]['longName'].toString();
    ativo.currency = quotePrice[symbol]['currency'].toString();
    // ativo.latestTime= quotePrice[symbol][''].toString();
    // ativo.delayedPrice = quotePrice[symbol][''].toString();
    // ativo.peRatio = quotePrice[symbol][''].toString();
    // ativo.primaryExchange = quotePrice[symbol][''].toString();

    return ativo;
  }
}

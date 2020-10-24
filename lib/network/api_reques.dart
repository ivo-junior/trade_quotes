import 'dart:async';
import 'dart:convert' as Convert;
import 'dart:io';
import 'package:finance_quote/finance_quote.dart';
import 'package:http/http.dart' as Http;
import 'package:trade_quotes/data/repository.dart';

import 'package:trade_quotes/models/lists.dart' as MarketLists;
import 'package:trade_quotes/models/ativo.dart';
import 'package:trade_quotes/models/charts.dart' as Charts;
import 'package:trade_quotes/models/lists.dart';

class ApiReques {
  static ApiReques _sIexApiProxyInstance;
  // final Http.Client httpClient = Http.Client();

  Repository _repository;

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
    _repository = Repository();
    List<MarketLists.MarketList> list = [];
    switch (marketListType) {
      case MarketLists.MarketListType.GAINERS:
        list = await lists(await _repository.findAllReduc(50), marketListType);

        break;
      case MarketLists.MarketListType.LOSERS:
        list = await lists(await _repository.findAllReduc(50), marketListType);
        break;
      case MarketLists.MarketListType.STOCKS:
        list = await lists(
            await _repository.findAllStocksReduc(50), marketListType);
        break;
      case MarketLists.MarketListType.CRIPTO:
        list = await lists(
            await _repository.findAllCurrencyReduc(50), marketListType);
        break;

      case MarketLists.MarketListType.FUTURE:
        list = await lists(
            await _repository.findAllFutureReduc(50), marketListType);
        break;

      case MarketLists.MarketListType.INDEX:
        list = await lists(
            await _repository.findAllIndexReduc(50), marketListType);
        break;

      case MarketLists.MarketListType.MUTUAL_FUND:
        list = await lists(
            await _repository.findAllMutualFundReduc(50), marketListType);
        break;

      case MarketLists.MarketListType.ETF:
        list =
            await lists(await _repository.findAllEtfReduc(50), marketListType);
        break;
    }

    return list;
  }

  Future<List<MarketList>> lists(
      List symbols, MarketLists.MarketListType marketListType) async {
    var list1 = fetchAtivos(symbols);
    var list2 = list1;

    List<Ativo> list;

    List<MarketList> lsMarket;

    switch (marketListType) {
      case MarketLists.MarketListType.GAINERS:
        list2.sort((a, b) => double.parse(b.changePercent)
            .compareTo(double.parse(a.changePercent)));
        list = list2;

        break;
      case MarketLists.MarketListType.LOSERS:
        list2.sort((a, b) => double.parse(a.changePercent)
            .compareTo(double.parse(b.changePercent)));
        list = list2;

        break;
      case MarketLists.MarketListType.STOCKS:
        list = list1;
        break;
      case MarketLists.MarketListType.CRIPTO:
        list = list1;
        break;
      case MarketLists.MarketListType.FUTURE:
        list = list1;
        break;
      case MarketLists.MarketListType.ETF:
        list = list1;
        break;
      case MarketLists.MarketListType.INDEX:
        list = list1;
        break;
      case MarketLists.MarketListType.MUTUAL_FUND:
        list = list1;
        break;
    }

    list.forEach((element) {
      lsMarket.add(MarketList(marketListType, element));
    });

    return lsMarket;
  }

  Future<List<Ativo>> fetchCollectionsFor(String sector) async {
    print("Fetching $sector!");
    List<Ativo> list = [];
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

  List<Ativo> fetchAtivos(List symbols) {
    _repository = Repository();
    List<Ativo> list;

    symbols.forEach((element) async {
      var fet = fetchSingleAtivo(element['symbol']);
      list.add(await fet);
    });

    return list;
  }

  Future<Ativo> fetchSingleAtivo(String symbol) async {
    Ativo ativo;

    try {
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
      ativo.avgTotalVolume =
          quotePrice[symbol]['regularMarketVolume'].toString();
      ativo.companyName = quotePrice[symbol]['longName'].toString();
      ativo.currency = quotePrice[symbol]['currency'].toString();
      ativo.latestTime = quotePrice[symbol]['regularMarketTime'].toString();
      ativo.delayedPrice = quotePrice[symbol]['exangeDataDelayadBy'].toString();
      ativo.peRatio = quotePrice[symbol]['forwardPE'].toString();
      ativo.primaryExchange = quotePrice[symbol]['fullExchangeName'].toString();

      return ativo;
    } catch (e) {
      return null;
    }
  }
}

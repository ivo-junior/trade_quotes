import 'dart:math';

import 'package:dio/dio.dart';
import 'package:trade_quotes/util/urls.dart';

class Repository {
  Dio _dio;

  Response _response;

  Repository() {
    this._dio = Dio();
  }

  Future<List> findAll() async {
    List list;

    list = await findAllCurrency();

    await findAllIndex().then((value) => value.forEach((element) {
          list.add(element);
        }));
    await findAllStocks().then((value) => value.forEach((element) {
          list.add(element);
        }));
    await findAllEtf().then((value) => value.forEach((element) {
          list.add(element);
        }));
    await findAllFuture().then((value) => value.forEach((element) {
          list.add(element);
        }));
    await findAllMutualFund().then((value) => value.forEach((element) {
          list.add(element);
        }));

    return list;
  }

  Future<List> findAllCurrency() async {
    List list;

    this._response = await this._dio.get(Urls.FIND_ALL_CURRENCY);

    list = this._response.data;

    return list;
  }

  Future<List> findAllStocks() async {
    List list;

    this._response = await this._dio.get(Urls.FIND_ALL_STOCKS);

    list = this._response.data;

    return list;
  }

  Future<List> findAllIndex() async {
    List list;

    this._response = await this._dio.get(Urls.FIND_ALL_INDEX);

    list = this._response.data;

    return list;
  }

  Future<List> findAllFuture() async {
    List list;

    this._response = await this._dio.get(Urls.FIND_ALL_FUTURE);

    list = this._response.data;

    return list;
  }

  Future<List> findAllMutualFund() async {
    List list;

    this._response = await this._dio.get(Urls.FIND_ALL_MUTUAL_FUND);

    list = this._response.data;

    return list;
  }

  Future<List> findAllEtf() async {
    List list;

    this._response = await this._dio.get(Urls.FIND_ALL_ETF);

    list = this._response.data;

    return list;
  }

  Future<List> findAllReduc(int tamList) async {
    List list;

    int max = 20000;

    var numAle = new Random();

    for (var i = 0; i < tamList; i++) {
      await findAllCurrency()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
      await findAllIndex()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
      await findAllStocks()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
      await findAllEtf()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
      await findAllFuture()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
      await findAllMutualFund()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
    }

    return list;
  }

  Future<List> findAllCurrencyReduc(int tamList) async {
    List list;

    int max = 20000;

    var numAle = new Random();

    for (var i = 0; i < tamList; i++) {
      await findAllCurrency()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
    }

    return list;
  }

  Future<List> findAllStocksReduc(int tamList) async {
    List list;

    int max = 20000;

    var numAle = new Random();

    for (var i = 0; i < tamList; i++) {
      await findAllStocks()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
    }

    return list;
  }

  Future<List> findAllIndexReduc(int tamList) async {
    List list;

    int max = 20000;

    var numAle = new Random();

    for (var i = 0; i < tamList; i++) {
      await findAllIndex()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
    }

    return list;
  }

  Future<List> findAllFutureReduc(int tamList) async {
    List list;

    int max = 20000;

    var numAle = new Random();

    for (var i = 0; i < tamList; i++) {
      await findAllFuture()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
    }

    return list;
  }

  Future<List> findAllMutualFundReduc(int tamList) async {
    List list;

    int max = 20000;

    var numAle = new Random();

    for (var i = 0; i < tamList; i++) {
      await findAllMutualFund()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
    }

    return list;
  }

  Future<List> findAllEtfReduc(int tamList) async {
    List list;

    int max = 20000;

    var numAle = new Random();

    for (var i = 0; i < tamList; i++) {
      await findAllEtf()
          .then((value) => value.indexOf(numAle.nextInt(max)))
          .then((value) => list.add(value));
    }

    return list;
  }
}
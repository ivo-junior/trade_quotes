import 'package:dio/dio.dart';
import 'package:trade_quotes/shared/repository_util.dart';

class Repository {
  Dio _dio;
  Response _response;
  Repository() {
    this._dio = Dio();
  }

  Future<void> findAll() async {
    this._response = await this._dio.get(RepositoryUTIL.GET_DADOS);
  }
}

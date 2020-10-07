import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

class AtivoListModel {
  Future<void> csvArq() async {
    var arquivo = File('dadosYahoo.csv').openRead();

    var csv = await arquivo
        .transform(utf8.decoder)
        .transform(CsvToListConverter(fieldDelimiter: ","))
        .toList();
  }
}

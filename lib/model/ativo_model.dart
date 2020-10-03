import 'package:finance_quote/finance_quote.dart';

class AtivoModel {
  String precoAtual = "",
      baixaDia = "",
      altaDia = "",
      abertura = "",
      mudanca = "",
      volume = "",
      nomeAtivo = "",
      moedaCompra = "";

  AtivoModel(String nomeAtivo) {
    _infoAtivo(nomeAtivo);
  }

  Future<void> _infoAtivo(String nome) async {
    final Map<String, Map<String, dynamic>> quotePrice =
        await FinanceQuote.getRawData(
            quoteProvider: QuoteProvider.yahoo, symbols: <String>[nome]);

    abertura = quotePrice[nome]['regularMarketOpen'].toString();
    baixaDia = quotePrice[nome]['regularMarketDayLow'].toString();
    altaDia = quotePrice[nome]['regularMarketDayHigh'].toString();
    precoAtual = quotePrice[nome]['regularMarketPrice'].toString();
    mudanca = quotePrice[nome]['regularMarketChange'].toString();
    volume = quotePrice[nome]['regularMarketVolume'].toString();
    nomeAtivo = quotePrice[nome]['longName'].toString();
    moedaCompra = quotePrice[nome]['currency'].toString();
  }
}

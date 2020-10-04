import 'package:finance_quote/finance_quote.dart';
import 'package:trade_quotes/model/ativo_model.dart';

class ApiReques {
  Future<void> infoAtivo(AtivoModel ativo, String nome) async {
    final Map<String, Map<String, dynamic>> quotePrice =
        await FinanceQuote.getRawData(
            quoteProvider: QuoteProvider.yahoo, symbols: <String>[nome]);

    ativo.abertura = quotePrice[nome]['regularMarketOpen'].toString();
    ativo.baixaDia = quotePrice[nome]['regularMarketDayLow'].toString();
    ativo.altaDia = quotePrice[nome]['regularMarketDayHigh'].toString();
    ativo.precoAtual = quotePrice[nome]['regularMarketPrice'].toString();
    ativo.mudanca = quotePrice[nome]['regularMarketChange'].toString();
    ativo.volume = quotePrice[nome]['regularMarketVolume'].toString();
    ativo.nomeAtivo = quotePrice[nome]['longName'].toString();
    ativo.moedaCompra = quotePrice[nome]['currency'].toString();
  }
}

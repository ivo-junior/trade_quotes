import 'package:flutter/material.dart';
import 'package:trade_quotes/model/ativo_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FinanceQuoteMain(),
    );
  }
}

class FinanceQuoteMain extends StatefulWidget {
  @override
  _FinanceQuoteState createState() => _FinanceQuoteState();
}

class _FinanceQuoteState extends State<FinanceQuoteMain> {
  var klablim = AtivoModel('KLBN4.SA');
  var petro = AtivoModel('PETR4.SA');
  var itau = AtivoModel('ITUB4.SA');

  @override
  Widget build(BuildContext context) {
    print(itau.abertura);

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'ITUB4',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          // 'Itau SA',
                          itau.nomeAtivo,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    FlatButton(
                      child: Text(
                        'ITAU',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () => {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'R\$',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Text(
                      // itauPrecoAtual,
                      itau.precoAtual,
                      style: TextStyle(fontSize: 60),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Min',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              // itauBaixa,
                              itau.baixaDia,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Max',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              // itauAlta,
                              itau.altaDia,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[],
                    )
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[200],
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'PETR4',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          // 'Petrobras SA',
                          petro.nomeAtivo,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    FlatButton(
                      child: Text(
                        'PETROBRAS',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () => {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'R\$',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Text(
                      // petroPrecoAtual,
                      petro.precoAtual,
                      style: TextStyle(fontSize: 60),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Min',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              // petroBaixa,
                              petro.baixaDia,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Max',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              // petroAlta,
                              petro.altaDia,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'KLBN4',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          // 'Klabin SA',
                          klablim.nomeAtivo,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    FlatButton(
                      child: Text(
                        'KLABIN',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () => {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'R\$',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Text(
                      // klabinPrecoAtual,
                      klablim.precoAtual,
                      style: TextStyle(fontSize: 60),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Min',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              // klabinBaixa,
                              klablim.baixaDia,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Max',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              // klabinAlta,
                              klablim.altaDia,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }

  // Future<String> mudaState() {
  //   setState(() {
  //     itau.abertura;
  //     itau.altaDia;
  //     itau.baixaDia;
  //     itau.precoAtual;
  //     itau.nomeAtivo;
  //     klablim.abertura;
  //     klablim.altaDia;
  //     klablim.baixaDia;
  //     klablim.precoAtual;
  //     klablim.nomeAtivo;
  //     petro.abertura;
  //     petro.altaDia;
  //     petro.baixaDia;
  //     petro.precoAtual;
  //     petro.nomeAtivo;
  //   });
  // }

  // Future<String> klabinPreco() async {
  //   final Map<String, Map<String, dynamic>> quotePrice =
  //       await FinanceQuote.getRawData(
  //           quoteProvider: QuoteProvider.yahoo, symbols: <String>['KLBN4.SA']);
  //   setState(() {
  //     klabinPrecoAtual =
  //         quotePrice['KLBN4.SA']['regularMarketPrice'].toString();
  //     klabinBaixa = quotePrice['KLBN4.SA']['regularMarketDayLow'].toString();
  //     klabinAlta = quotePrice['KLBN4.SA']['regularMarketDayHigh'].toString();
  //   });
  // }

  // Future<String> petroPreco() async {
  //   final Map<String, Map<String, dynamic>> quotePrice =
  //       await FinanceQuote.getRawData(
  //           quoteProvider: QuoteProvider.yahoo, symbols: <String>['PETR4.SA']);
  //   setState(() {
  //     petroPrecoAtual = quotePrice['PETR4.SA']['regularMarketPrice'].toString();
  //     petroBaixa = quotePrice['PETR4.SA']['regularMarketDayLow'].toString();
  //     petroAlta = quotePrice['PETR4.SA']['regularMarketDayHigh'].toString();
  //   });
  // }

  // Future<String> itauPreco() async {
  //   final Map<String, Map<String, dynamic>> quotePrice =
  //       await FinanceQuote.getRawData(
  //           quoteProvider: QuoteProvider.yahoo, symbols: <String>['ITUB4.SA']);
  //   setState(() {
  //     itauPrecoAtual = quotePrice['ITUB4.SA']['regularMarketPrice'].toString();
  //     itauBaixa = quotePrice['ITUB4.SA']['regularMarketDayLow'].toString();
  //     itauAlta = quotePrice['ITUB4.SA']['regularMarketDayHigh'].toString();
  //     print('Teste');
  //   });
  // }
}

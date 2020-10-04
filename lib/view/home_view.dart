import 'package:flutter/material.dart';
import 'package:trade_quotes/controller/home_controller.dart';

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
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
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
                          controller.itau.nomeAtivo,
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
                      controller.itau.precoAtual,
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
                              controller.itau.baixaDia,
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
                              controller.itau.altaDia,
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
                          controller.petro.nomeAtivo,
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
                      controller.petro.precoAtual,
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
                              controller.petro.baixaDia,
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
                              controller.petro.altaDia,
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
                          controller.klb.nomeAtivo,
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
                      controller.klb.precoAtual,
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
                              controller.klb.baixaDia,
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
                              controller.klb.altaDia,
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
}

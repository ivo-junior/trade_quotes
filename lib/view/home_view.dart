import 'package:flutter/material.dart';
import 'package:trade_quotes/controller/home_controller.dart';
import 'package:trade_quotes/model/ativo_model.dart';
import 'package:trade_quotes/view/bloco.dart';

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
  Bloco bloc1 = Bloco();
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Text(
            'Stocks',
            style: TextStyle(fontSize: 50),
            textAlign: TextAlign.start,
          ),
          Row(children: <Widget>[Bloco(), bloc1, Bloco(), Bloco(), Bloco()]),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trade_quotes/view/ativo_detalado.dart';
import 'package:trade_quotes/view/home.dart';
import 'package:trade_quotes/view/home_view.dart';

import 'model/ativo_model.dart';
import 'view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> rotas = {
      'MyHomePage': (__) => MyHomePage(),
      'AtivoDetalhado': (__) => AtivoDetalhado(AtivoModel('PETR4', '15.0',
          '14.0', '16.0', '13.0', '0.35%', '25.000', 'Petrobras SA', 'BRL'))
    };
    return MaterialApp(
      title: 'TRADE QUOTES',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: Color(0xFF529C82),
          iconTheme: IconThemeData(color: Colors.white),
          accentColor: Color(0xFFed8d8d),
          backgroundColor: Color(0xFF529C82),
          secondaryHeaderColor: Color(0xFF4d4545)),
      home: Home(),
      routes: rotas,
    );
  }
}

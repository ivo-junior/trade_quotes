import 'package:flutter/material.dart';
import 'package:trade_quotes/view/home.dart';
import 'package:trade_quotes/view/home_view.dart';

import 'view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> rotas = {'MyHomePage': (__) => MyHomePage()};
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

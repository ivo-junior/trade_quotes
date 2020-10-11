import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_quotes/Data/repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository repository;
  void StartTime() {
    new Timer(Duration(seconds: 3), navigatePage);
  }

  void navigatePage() {
    Navigator.pushReplacementNamed(context, 'MyHomePage');
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    repository = Repository();
    this.StartTime();
  }

  @override
  Widget build(BuildContext context) {
    //  this.StartTime();
    return Scaffold(
      backgroundColor: Color(0xFF529C82),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

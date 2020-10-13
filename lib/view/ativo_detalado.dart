import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_quotes/model/ativo_model.dart';

class AtivoDetalhado extends StatefulWidget {
  AtivoModel ativoModel;
  AtivoDetalhado(AtivoModel ativoModel) {
    this.ativoModel = ativoModel;
  }
  @override
  _AtivoDetalhadoState createState() => _AtivoDetalhadoState(ativoModel);
}

class _AtivoDetalhadoState extends State<AtivoDetalhado> {
  AtivoModel ativo;
  _AtivoDetalhadoState(AtivoModel ativoModel) {
    this.ativo = ativoModel;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          // backgroundColor: Color.alphaBlend(Colors.white, Colors.transparent),
          backgroundColor: Colors.transparent,
          child: Center(child: Icon(Icons.arrow_back)),
          onPressed: () {
            navigatePage();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ativo',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            )),
            Row(
              children: [
                Column(
                  children: <Widget>[
                    Text('${ativo.nomeAtivo} -',
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
                Text(' ${ativo.siglaAtivo}',
                    // 'Codigo reduzido: ${ativo.siglaAtivo}',
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ));
  }

  void navigatePage() {
    Navigator.pushReplacementNamed(context, 'MyHomePage');
  }
}

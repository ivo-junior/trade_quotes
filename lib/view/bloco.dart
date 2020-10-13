import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_quotes/model/ativo_model.dart';

class Bloco extends StatefulWidget {
  AtivoModel ativoModel;
  Bloco(AtivoModel ativoModel) {
    this.ativoModel = ativoModel;
  }
  @override
  _BlocoState createState() => _BlocoState(ativoModel);
}

class _BlocoState extends State<Bloco> {
  AtivoModel ativo;
  _BlocoState(AtivoModel ativoModel) {
    this.ativo = ativoModel;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 198,
        width: 208,
        child: FlatButton(
          onPressed: () {
            navigatePage();
          }, //Aqui a nova tela
          child: Container(
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
                          ativo.siglaAtivo,
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Text(
                      ativo.nomeAtivo,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
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
                      ativo.precoAtual,
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
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
                              ativo.baixaDia,
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
                              ativo.altaDia,
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
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(10)),
          ),
        ));
  }

  void navigatePage() {
    Navigator.pushReplacementNamed(context, 'AtivoDetalhado');
  }
}

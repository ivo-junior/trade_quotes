import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_quotes/model/ativo_model.dart';

class Bloco extends StatefulWidget {
  @override
  _BlocoState createState() => _BlocoState();
}

class _BlocoState extends State<Bloco> {
  AtivoModel ativo = AtivoModel('Resultado de alguma Consulta');
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(
                    ativo.nomeAtivo,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              FlatButton(
                child: Text(
                  ativo.nomeAtivo,
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () => {},
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
                style: TextStyle(fontSize: 60),
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
                        // itauBaixa,
                        // controller.itau.baixaDia,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[],
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.yellow[100], borderRadius: BorderRadius.circular(10)),
    );
    SizedBox(
      height: 30,
    );
  }
}
